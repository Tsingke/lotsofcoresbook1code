*
* $Id: neb_drv.F 25912 2014-07-15 01:15:00Z bylaska $
*

*     ****************************************
*     *                                      *
*     *                neb                   *
*     *                                      *
*     ****************************************
      logical function neb(rtdb)
      implicit none
      integer rtdb

#include "global.fh"
#include "mafdecls.fh"
#include "rtdb.fh"
#include "util.fh"
#include "stdio.fh"
#include "errquit.fh"

c     
*     **** local variables ****     
      logical value,newchain,svalue,verlet,oprint,done,converged,found
      logical ostress,finishedstep,converged1
      character*9 cvg1,cvg2,cvg3,cvg4
      character*4    mark
      character*50 bead_list,filename
      character*80 title,neb_movecs
      character*30 tmp
      character*255 full_filename,full_filename2,filename2
      character ch_tmp
      integer ii,shift,print_shift,print_count,jj,manyjj,itm,goodjj
      integer i,it,nbeads,nion,ng,m,nebsteps,neb_algorithm
      integer nbeads1,nbeads2
      integer e1(2),g0(2),g1(2),s(2),t1(2),v1(2),c0(2),c1(2)
      integer mass(2),dti(2),cs(2),gs(2)
      real*8  path_energy,path_distance,norm,norm0,time_step,kbeads
      real*8  Gmax,Grms,Xmax,Xrms,dE,path_energy0,emid,emax,emin,trust
      real*8  nebGmax,nebGrms,nebXmax,nebXrms,nebdE,sum,sum2,t,alpha
      real*8  alphamin,deltaE,sum0,sum0_old,time_step0
      real*8  emid0,emin0,emax0

*     **** external functions ****
      logical task_gradient
      external task_gradient
      integer  size_bead_list,nion_bead_list
      real*8   energy_bead_list
      external size_bead_list,nion_bead_list
      external energy_bead_list
      character*7 bead_index_name
      external    bead_index_name


      oprint = ga_nodeid() .eq. 0

      if (oprint) then
         write(luout,*)
         write(luout,*)
         call util_print_centered(luout,
     >        'NWChem Minimum Energy Pathway Program (NEB)',
     >        40,.true.)
         write(luout,*)
         write(luout,*)
      endif

      if (rtdb_cget(rtdb,'title',1,title)) then
         if (oprint) then
            write(luout,*)
            write(luout,*)
            call util_print_centered(6, title, 40, .false.)
            write(luout,*)
            write(luout,*)
         endif
      endif
      if (.not. rtdb_get(rtdb,'neb:gmax',mt_dbl,1,nebgmax))
     >   nebgmax = 0.00045d0
      if (.not. rtdb_get(rtdb,'neb:grms',mt_dbl,1,nebgrms))
     >   nebgrms = 0.00030d0
      if (.not. rtdb_get(rtdb,'neb:xmax',mt_dbl,1,nebxmax))
     >   nebxmax = 0.000180d0
      if (.not. rtdb_get(rtdb,'neb:xrms',mt_dbl,1,nebxrms))
     >   nebxrms = 0.000120d0

      if (.not.rtdb_get(rtdb,'neb:stepsize',mt_dbl,1,time_step))
     >  time_step = 1.0d0
      if (.not.rtdb_get(rtdb,'neb:trust',mt_dbl,1,trust))
     >  trust = 0.1d0
      if (.not.rtdb_get(rtdb,'neb:kbeads',mt_dbl,1,kbeads))
     >  kbeads = 0.1d0
      if (.not.rtdb_get(rtdb,'neb:steps',mt_int,1,nebsteps))      
     >   nebsteps = 5

      if (.not.rtdb_cget(rtdb,'neb:movecs',1,neb_movecs)) then
         call util_file_prefix('movecs',neb_movecs)
      end if

*     *** neb_algorithm ***
      if (.not.rtdb_get(rtdb,'neb:algorithm',mt_int,1,neb_algorithm))
     >  neb_algorithm = 0
      if (.not.rtdb_get(rtdb,'neb:m',mt_int,1,m))  m = 5

      if (.not.rtdb_get(rtdb,'neb:print_shift',mt_int,1,print_shift))
     >   print_shift = 0

*     **** neb_epath filename ****
      call util_file_prefix('neb_epath',filename)
      call util_file_name_noprefix(filename,.false.,
     >                             .false.,
     >                             full_filename)

*     **** includestress? ****
      if (.not. rtdb_get(rtdb,'includestress',mt_log,1,ostress))
     >   ostress = .false.



*  RRR only initialize if this is a new neb chain!
*     **** initialize neb list ****
      bead_list = 'bead_list'
      newchain = .false.
      if (.not.rtdb_get(rtdb,'bead_list:new',mt_log,1,newchain))
     >  newchain = .true.

      if(newchain) then
        if (oprint) write(*,*)'NEW NEB CHAIN, INITIALIZING'
        call neb_initialize(rtdb,bead_list)
        print_count = 0
      else
         if (oprint) write(*,*)'EXISTING NEB CHAIN? RESTARTING'
         call set_rtdb_bead_list(rtdb)
         nbeads1 = size_bead_list(bead_list)
         if (.not.rtdb_get(rtdb,'neb:nbeads',mt_int,1,nbeads2))
     >      nbeads2 = 5
         if (nbeads1.ne.nbeads2) then
            if (oprint) write(*,*) 'RESIZING NEB CHAIN'
            call neb_resize_path(rtdb,bead_list,nbeads1,nbeads2)
         end if
         if (.not.rtdb_get(rtdb,'neb:print_count',mt_int,1,print_count))
     >      print_count = 0
      end if
      newchain = .false.

      nbeads = size_bead_list(bead_list)
      nion   = nion_bead_list(bead_list,1)
      ng     = 3*nion*nbeads

      if (oprint) then

         if (neb_algorithm.eq.0) then
            tmp = "Fixed Point"
         else if (neb_algorithm.eq.1) then
            tmp = "Verlet"
         else if (neb_algorithm.eq.2) then
            tmp = "refining conjugate gradient"
         else
            tmp = "not implemented"
         end if
         
         write(luout,*)
         write(luout,1) nebgmax,nebgrms,nebxmax,nebxrms,
     >                  time_step,trust,nebsteps,nbeads,m,nion,kbeads,
     >                  neb_algorithm,tmp,
     >                  neb_movecs
         if (ostress) 
     >      write(luout,*) ' INCLUDING STRESS !!!!!!!!!!!!!!!!'
         write(luout,*)
         write(luout,*)
 1       format(
     >        ' maximum gradient threshold         (gmax) = ', f10.6,/,
     >        ' rms gradient threshold             (grms) = ', f10.6,/,
     >        ' maximum cartesian step threshold   (xmax) = ', f10.6,/,
     >        ' rms cartesian step threshold       (xrms) = ', f10.6,/,
     >        0p,/,
     >        ' step size                      (stepsize) = ', f10.6,/,
     >        ' fixed trust radius                (trust) = ', f10.6,/,
     >        ' maximum number of steps         (maxiter) = ', i4,/,
     >        ' number of images in path         (nbeads) = ', i4,/,
     >        ' number of histories               (nhist) = ', i4,/,
     >        ' number of atoms                           = ', i4,/,
     >        ' NEB spring constant in a.u.      (kbeads) = ', f10.6,/,
     >        ' NEB algorithm                 (algorithm) = ', i4,
     >                                                   1x,'(',a30,')'/,
     >        ' NEB movecs filename                       = ', a)
      end if


*     **** allocate space for gradients and coordinates ****
      value  = MA_alloc_get(mt_dbl,nbeads,'e1',e1(2),e1(1))
      value  = value.and.
     >         MA_alloc_get(mt_dbl,ng,'g0',g0(2),g0(1))
      value  = value.and.
     >         MA_alloc_get(mt_dbl,ng,'g1',g1(2),g1(1))
      value  = value.and.
     >         MA_alloc_get(mt_dbl,ng,'s',s(2),s(1))
      value  = value.and.
     >         MA_alloc_get(mt_dbl,ng,'t1',t1(2),t1(1))
      value  = value.and.
     >         MA_alloc_get(mt_dbl,ng,'v1',v1(2),v1(1))
      value  = value.and.
     >         MA_alloc_get(mt_dbl,ng,'c0',c0(2),c0(1))
      value  = value.and.
     >         MA_alloc_get(mt_dbl,ng,'c1',c1(2),c1(1))
      value  = value.and.
     >         MA_alloc_get(mt_dbl,ng,'dti',dti(2),dti(1))
      if (.not.value) 
     >  call errquit('neb failed - increase heap memory',1,0)


      value  = 
     >         MA_alloc_get(mt_dbl,m*ng,'cs',cs(2),cs(1))
      value  = value.and.
     >         MA_alloc_get(mt_dbl,m*ng,'gs',gs(2),gs(1))
      if (.not.value) 
     >  call errquit('neb failed - increase heap memory',1,0)


*     *** set dti ***
      value  = MA_alloc_get(mt_dbl,nion,'mass',mass(2),mass(1))      
      if (.not.value) 
     >  call errquit('neb failed - increase heap memory',2,0)
      call neb_masses_get(rtdb,dbl_mb(mass(1)))

      do i=1,nbeads
        do it=1,nion
          dbl_mb(dti(1)+3*nion*(i-1)+3*(it-1)   )
     >    = -(time_step**2)/dbl_mb(mass(1)+it-1)
          dbl_mb(dti(1)+3*nion*(i-1)+3*(it-1) +1)
     >    = -(time_step**2)/dbl_mb(mass(1)+it-1)
          dbl_mb(dti(1)+3*nion*(i-1)+3*(it-1) +2)
     >    = -(time_step**2)/dbl_mb(mass(1)+it-1)
        end do
      end do
      value = MA_free_heap(mass(2))      
      if (.not.value) call errquit('neb failed',3,0)
  

*     **** initial step ****
      if (oprint) write(luout,*) "neb: Calculating Initial Path Energy"
      call neb_coords_get(bead_list,dbl_mb(c1(1)))
      call runall_bead_list(bead_list,task_gradient)
      call neb_energies_get(bead_list,dbl_mb(e1(1)))
      call dcopy(ng,0.0d0,0,dbl_mb(t1(1)),1)
      call dcopy(ng,0.0d0,0,dbl_mb(g1(1)),1)
      call neb_gradient_get(bead_list,kbeads,
     >                      dbl_mb(c1(1)),
     >                      dbl_mb(e1(1)),
     >                      dbl_mb(t1(1)),
     >                      dbl_mb(g1(1))) 
      sum0 = ddot(ng,dbl_mb(g1(1)),1,dbl_mb(g1(1)),1)
      sum0_old = sum0
      manyjj = 0
      goodjj = 0
      time_step0 = time_step

c      do i=1,ng
c       write(*,*) "i,c1(i)=",i,dbl_mb(c1(1)+i-1)
c      end do

      call neb_path_energy(bead_list,
     >                     path_distance,
     >                     path_energy) 

      if (oprint) then
         write(luout,*) "neb: sum0=",sum0,ng
         write(luout,*)
         write(luout,*) "neb: Initial Path Energy    "
         write(luout,*) "neb: -----------------------"
         do i=1,nbeads
            write(luout,*) "neb: ",i,dbl_mb(e1(1)+i-1)
         end do
         write(luout,*)
      end if
      call create_xyz_file_bead_list(luout,bead_list,.true.)

      norm = dsqrt(ddot(ng,dbl_mb(g1(1)),1,dbl_mb(g1(1)),1))
      if (oprint) write(luout,*) "Path Energy, Path Distance, |G_neb|:",
     >            path_energy,path_distance,norm

      call dcopy(ng,dbl_mb(g1(1)),1,dbl_mb(s(1)),1)

      it  = 0
      itm = 0
      done = .false.
      do while (.not.done)
         it  = it + 1
         itm = itm + 1
         if (oprint) write(luout,*) 'neb: iteration #',it,itm

*        *** save old forces  and coordinates ***
         call dcopy(ng,dbl_mb(c1(1)),1,dbl_mb(c0(1)),1)
         call dcopy(ng,dbl_mb(g1(1)),1,dbl_mb(g0(1)),1)

         norm0=norm

         
*         ***** fixed point iteration ****
          if (neb_algorithm.eq.0) then
             if (oprint) write(luout,*)'neb: using fixed point'

             if (itm.le.m) then
                shift = (itm-1)*ng
                call dcopy(ng,dbl_mb(c0(1)),1,dbl_mb(cs(1)+shift),1)
                call dcopy(ng,dbl_mb(g0(1)),1,dbl_mb(gs(1)+shift),1)
                if (itm.gt.1) then
                   call neb_lmbfgs(ng,itm,
     >                             dbl_mb(cs(1)),
     >                             dbl_mb(gs(1)),
     >                             dbl_mb(s(1)))
                else
                   call dcopy(ng,dbl_mb(g0(1)),1,dbl_mb(s(1)),1)
                end if
             else
                do ii=1,m-1
                   shift = (ii-1)*ng
                   call dcopy(ng,dbl_mb(cs(1)+shift+ng),1,
     >                           dbl_mb(cs(1)+shift),   1)
                   call dcopy(ng,dbl_mb(gs(1)+shift+ng),1,
     >                           dbl_mb(gs(1)+shift),   1)
 
                end do
                shift = (m-1)*ng
                call dcopy(ng,dbl_mb(c0(1)),1,dbl_mb(cs(1)+shift),1)
                call dcopy(ng,dbl_mb(g0(1)),1,dbl_mb(gs(1)+shift),1)
                call neb_lmbfgs(ng,m,
     >                          dbl_mb(cs(1)),
     >                          dbl_mb(gs(1)),
     >                          dbl_mb(s(1)))
             end if
c             call neb_project_gradient(nion,nbeads,
c     >                                dbl_mb(t1(1)),
c     >                                dbl_mb(s(1)))

             finishedstep = .false.
             alpha = time_step
             jj = 0
             do while ((.not.finishedstep).and.(jj.lt.9))
             jj = jj + 1
             sum = ddot(ng,dbl_mb(g0(1)),1,dbl_mb(s(1)),1)

             if ((sum.le.0.0d0).or.(sum0.gt.sum0_old))  then
                call dcopy(ng,dbl_mb(g0(1)),1,dbl_mb(s(1)),1)
                itm = 0
                if (oprint) write(*,*) "neb: s=g and itm reset to 0"
             end if

             sum2 = dsqrt(ddot(ng,dbl_mb(s(1)),1,dbl_mb(s(1)),1))
     >              /dble(nbeads)
             if (oprint) 
     >          write(*,*) "neb: |<s|s>|,<g|s>=",sum2,sum

             call neb_move(ng,
     >                     (-alpha),
     >                     dbl_mb(c0(1)),
     >                     dbl_mb(c1(1)),
     >                     dbl_mb(s(1)))
              call neb_coords_set(bead_list,dbl_mb(c1(1)))

              if (oprint) write(luout,*) "neb: running internal beads"
              call runmid_bead_list(bead_list,task_gradient)

              call neb_energies_get(bead_list,dbl_mb(e1(1)))
              call neb_gradient_get(bead_list,kbeads,
     >                             dbl_mb(c1(1)),
     >                             dbl_mb(e1(1)),
     >                             dbl_mb(t1(1)),
     >                             dbl_mb(g1(1)))
               sum0     = ddot(ng,dbl_mb(g1(1)),1,dbl_mb(g1(1)),1)

               finishedstep = (sum0.le.sum0_old)
               if (.not.finishedstep) then
                   alpha = 0.50d0*alpha
                   manyjj = manyjj+1
                   goodjj = 0
                   if (manyjj.gt.2) then
                      time_step = 0.5d0*time_step
                      manyjj = 0
                      if (oprint) 
     >                   write(*,*) "neb: reducing timestep=",time_step
                   end if
               end if
               if (finishedstep.and.(jj.eq.1)) then
                  goodjj = goodjj + 1
                  if (goodjj.gt.10) then
                     time_step = 2.0d0*time_step
                     if (time_step.gt.time_step0) time_step = time_step0
                     goodjj = 0
                  end if
               end if

               if(oprint) 
     >             write(*,*) "neb: sum0,sum0_old=",
     >                        sum0,sum0_old,jj,finishedstep,alpha

c               if (finishedstep) sum0_old = sum0

             end do
             sum0_old = sum0


*         ***** Verlet iteration ****
          else if (neb_algorithm.eq.1) then
            IF (oprint) write(luout,*)'neb: using verlet algroithm'
            call neb_verlet_update(ng,
     >                         dbl_mb(c0(1)),
     >                         dbl_mb(c1(1)),
     >                         dbl_mb(v1(1)),
     >                         dbl_mb(dti(1)),
     >                         dbl_mb(g1(1)))

            call neb_coords_set(bead_list,dbl_mb(c1(1)))
            call runmid_bead_list(bead_list,task_gradient)
            call neb_energies_get(bead_list,dbl_mb(e1(1)))
            call neb_gradient_get(bead_list,kbeads,
     >                            dbl_mb(c1(1)),
     >                            dbl_mb(e1(1)),
     >                            dbl_mb(t1(1)),
     >                            dbl_mb(g1(1)))

*         ***** refined CG iteration ****
          else if (neb_algorithm.eq.2) then
            if (oprint) write(luout,*) 'neb: using cg algorithm'
            call neb_cg_direction(ng,
     >                         dbl_mb(g0(1)),
     >                         dbl_mb(g1(1)),
     >                         dbl_mb(s(1)))

            do ii=1,10

            if (oprint) write(luout,*) "neb: refining time step"
              call neb_move(ng,
     >                      time_step,
     >                      dbl_mb(c0(1)),
     >                      dbl_mb(c1(1)),
     >                      dbl_mb(s(1)))

              call neb_coords_set(bead_list,dbl_mb(c1(1)))
              if (oprint) write(luout,*) "neb: running internal beads"
              call runmid_bead_list(bead_list,task_gradient)
              call neb_energies_get(bead_list,dbl_mb(e1(1)))
              call neb_gradient_get(bead_list,kbeads,
     >                             dbl_mb(c1(1)),
     >                             dbl_mb(e1(1)),
     >                             dbl_mb(t1(1)),
     >                             dbl_mb(g1(1)))

              norm = dsqrt(ddot(ng,dbl_mb(g1(1)),1,dbl_mb(g1(1)),1))
              if(oprint)  write(luout,*) "neb: new gnorm=",norm
              if(oprint)  write(luout,*) "neb: old gnorm0=",norm0
              if(norm.gt.norm0) then
                time_step=time_step/2.0d0
                if (oprint) 
     >             write(luout,*) "neb: reducing time step ",time_step
              else
                call dscal(ng,time_step,dbl_mb(s(1)),1)
                if (oprint) 
     >             write(luout,*) "neb: accepting time step ",time_step
                go to 19
              end if
            end do
         end if
19       continue         

         if (oprint) then
            inquire(file=full_filename,exist=found)
*           **** CIF FILE already exists - parse to EOF ****
            if (found) then
              open(unit=19,file=full_filename,form='formatted',
     >             status='old')
              do while(.true.)
                read(19,*,ERR=30,END=30) ch_tmp
              end do
 30           continue
#if defined(FUJITSU_SOLARIS) || defined(PSCALE) || defined(SOLARIS) || defined(__crayx1) || defined(GCC46)
              backspace 19
#endif
            write(19,*) " "
*           **** .neb_epath FILE does not exist ****
            else
              open(unit=19,file=full_filename,form='formatted')
            end if
            write(19,*) 
     > "#-------------------------------------------------------"
            write(19,*)  "# NEB Path iteration = ",it
            write(19,*)  "# algorithm          = ",neb_algorithm
            write(19,*)  "# nbeads             = ",nbeads
            write(19,*)  "# nhist              = ",m
            write(19,*)  "# natoms             = ",nion
            write(19,*)  "# kbeads             = ",kbeads
            write(19,*)  "# stepsize           = ",time_step
            write(19,*)  "# trust              = ",trust
            write(19,*)  "# path energy        = ",path_energy
            write(19,*)  "# path distance      = ",path_distance
            write(19,*)  "# dE                 = ",dE
            write(19,*)  "# Gmax               = ",Gmax
            write(19,*)  "# Grms               = ",Grms
            write(19,*)  "# Xmax               = ",Xmax
            write(19,*)  "# Xrms               = ",Xrms
            write(19,*) 
     > "#-------------------------------------------------------"
            do i=1,nbeads
               t = (i-1)/dble(nbeads-1)
               write(19,*) t,dbl_mb(e1(1)+i-1)
            end do
            close(19)
         end if


*        *** RRR write out cumulative path energy
         if (oprint) then
            write(luout,*)
            write(luout,*) "neb: Path Energy #",it
            write(luout,*) "----------------------------"
            do i=1,nbeads
               write(luout,*) "neb: ",i,dbl_mb(e1(1)+i-1)
            end do
            write(luout,*)
         end if
         call create_xyz_file_bead_list(luout,bead_list,.true.)

*        **** write out current xyz file ***
         print_count = print_count + 1
         if (print_shift.gt.0) then
            if (mod(print_count,print_shift).eq.0) then
               call util_file_prefix(
     >                  'nebpath'//bead_index_name(print_count)//'.xyz',
     >                  filename2)
               call util_file_name_noprefix(filename2,.false.,
     >                             .false.,
     >                             full_filename2)
                if (oprint) 
     >            open(unit=23,file=full_filename2,form='formatted')
                call create_xyz_file_bead_list(23,bead_list,.false.)
                if (oprint) close(23)
            end if
         end if
         if (.not.rtdb_put(rtdb,'neb:print_count',mt_int,1,print_count))
     >      call errquit('setting neb:print_count failed',4,RTDB_ERR)

         emid0 = path_energy/path_distance
         call neb_path_energy(bead_list,
     >                        path_distance,
     >                        path_energy) 
         dE = dabs((path_energy/path_distance) - emid0)
         call neb_calc_convergence(ng,dbl_mb(g1(1)),
     >                                dbl_mb(c0(1)),
     >                                dbl_mb(c1(1)),
     >                                Gmax,Grms,Xmax,Xrms)

         emid0 = emid
         emin0 = emin
         emax0 = emax

         emin = +99.0d99
         emax = -99.0d99
         do i=1,nbeads
             if (dbl_mb(e1(1)+i-1)>emax) 
     >          emax = dbl_mb(e1(1)+i-1)
             if (dbl_mb(e1(1)+i-1)<emin) 
     >          emin = dbl_mb(e1(1)+i-1)
         end do
         i = nbeads/2
         if (i.lt.1) i = 1
         emid = dbl_mb(e1(1)+i-1)

         dE = dE + dabs(emid-emid0)
         dE = dE + dabs(emin-emin0)
         dE = dE + dabs(emax-emax0)

         if (oprint) then
           cvg1 = ' '
           cvg2 = ' '
           cvg3 = ' '
           cvg4 = ' '
           if (gmax .lt. nebGmax) cvg1 = '     ok  '
           if (grms .lt. nebGrms) cvg2 = '     ok  '
           if (xrms .lt. nebXrms) cvg3 = '     ok  '
           if (xmax .lt. nebXmax) cvg4 = '     ok  '

           mark = '@neb'
           if (it .gt. 1) mark = ' '

           write(luout,12)  mark," "
           write(luout,12)  mark,"NEB Method"
           write(luout,13)  mark,"algorithm      = ",neb_algorithm
           write(luout,13)  mark,"maxiter        = ",nebsteps
           write(luout,13)  mark,"nbeads         = ",nbeads
           write(luout,13)  mark,"nhist          = ",m
           write(luout,13)  mark,"natoms         = ",nion
           write(luout,14)  mark,"stepsize       = ",time_step
           write(luout,14)  mark,"trust          = ",trust
           write(luout,14)  mark,"kbeads         = ",kbeads
           write(luout,14)  mark,"Gmax tolerance = ",nebGmax
           write(luout,14)  mark,"Grms tolerance = ",nebGrms
           write(luout,14)  mark,"Xmax tolerance = ",nebXmax
           write(luout,14)  mark,"Xrms tolerance = ",nebXrms
           write(luout,12)  mark," "

           write(luout,10) mark, mark
     
           mark = '@neb'
           write(luout,11) mark, it, path_energy/path_distance, 
     >       emid,emin,emax,
     >       Gmax, Grms, Xrms, Xmax, util_wallsec(),
     >       cvg1,cvg2,cvg3,cvg4
 10        format(
     >        /,a4,' Step    Intrinsic E    Mid-Point E ',
     >        '     Minimum E      Maximum E   Gmax',
     >        '     Grms     Xrms     Xmax   Walltime',
     >        /,a4,' ---- -------------- -------------- --------------',
     >        ' --------------',
     >        ' -------- -------- -------- -------- --------')
 11        format(
     >        a4,i5,4f15.6,1p,4f9.5,f9.1,/,
     >        1x,5x,17x,9x,4a9,/)
 12        format(a4,1x,a)
 13        format(a4,1x,a,i9)
 14        format(a4,1x,a,e9.3)

         endif

        converged1 = (Gmax.le.nebgmax)
        converged =               (Grms.le.nebgrms)
        converged = converged.and.(Xmax.le.nebxmax)
        converged = converged.and.(Xrms.le.nebxrms)
        if (dE.gt.1.0d-6) converged = converged.and.converged1

        done = converged.or.(it.ge.nebsteps)
  
      end do
      if (oprint) then
         if (converged) then
            write(luout,'(a)') "@neb  NEB calculation converged"
            if (.not.converged1) 
     >         write(luout,'(2a)') 
     >           "@neb  However NEB Gmax not converged",
     >           "...Try increasing the number of beads."
         else
            write(luout,'(a)') "@neb   NEB calculation not converged"
         end if
          
      end if


*     **** write out final path energies ****
      call util_file_prefix('neb_final_epath',filename)
      call util_file_name_noprefix(filename,.false.,
     >                             .false.,
     >                             full_filename)
      if (oprint) then
         open(unit=19,file=full_filename,form='formatted')
         write(19,*) 
     > "#-------------------------------------------------------"
         write(19,*)  "# NEB Path"
         write(19,*)  "# algorithm     = ",neb_algorithm
         write(19,*)  "# nbeads        = ",nbeads
         write(19,*)  "# nhist         = ",m
         write(19,*)  "# natoms        = ",nion
         write(19,*)  "# kbeads        = ",kbeads
         write(19,*)  "# stepsize      = ",time_step
         write(19,*)  "# trust         = ",trust
         write(19,*)  "# path energy   = ",path_energy
         write(19,*)  "# path distance = ",path_distance
         write(19,*)  "# dE            = ",dE
         write(19,*)  "# Gmax          = ",Gmax
         write(19,*)  "# Grms          = ",Grms
         write(19,*)  "# Xmax          = ",Xmax
         write(19,*)  "# Xrms          = ",Xrms
         write(19,*) 
     > "#-------------------------------------------------------"
         do i=1,nbeads
            t = (i-1)/dble(nbeads-1)
            write(19,*) t,dbl_mb(e1(1)+i-1)
         end do
         close(19)
      end if

*     **** write out final xyz movies energies ****
      call util_file_prefix('neb_final.xyz',filename)
      call util_file_name_noprefix(filename,.false.,
     >                             .false.,
     >                             full_filename)
       if (oprint) open(unit=19,file=full_filename,form='formatted')
       call create_xyz_file_bead_list(19,bead_list,.false.)
       if (oprint) close(19)


      value = value.and.MA_free_heap(cs(2))
      value = value.and.MA_free_heap(gs(2))
      value = value.and.MA_free_heap(dti(2))
      value = value.and.MA_free_heap(c1(2))
      value = value.and.MA_free_heap(c0(2))
      value = value.and.MA_free_heap(v1(2))
      value = value.and.MA_free_heap(t1(2))
      value = value.and.MA_free_heap(s(2))
      value = value.and.MA_free_heap(g1(2))
      value = value.and.MA_free_heap(g0(2))
      value = value.and.MA_free_heap(e1(2))      
      if (.not.value) call errquit('neb failed',4,0)

      if (.not.rtdb_put(rtdb,'bead_list:new',mt_log,1,.false.))
     > call errquit('setting bead_list:new failed',4,RTDB_ERR)

      call ga_sync()
      neb = .true. 
      end

