      subroutine cmergd(c1,c2,nc,nb,no)
C$Id: cmergd.F 19708 2010-10-29 18:04:21Z d3y133 $
      implicit none
c.......................................................................
c     merge open and closed shell coefficient matrices.
c.......................................................................
      integer nc, nb, no
      real *8  c1(nb,*), c2(nb,*)
c
      integer i, j
      integer nlast, nrow
c
      nlast = nc + no
      nrow = nc + 1
      do i = nrow , nlast
         do j = 1 , nb
            c1(j,i) = c2(j,i)
         enddo
      enddo
      return
      end
