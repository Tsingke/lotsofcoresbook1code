#if ( __GNUC__ >= 4)
#else
      integer function ishft(i,j)
*
* $Id: linux_shift.F 22340 2012-04-25 22:02:33Z edo $
*
      implicit none
      integer i,j
c
c     routine to return i shifted by j bits
c
      if(j.eq.0) ishft=i
      if(j.gt.0) ishft=lshift(i,j)
      if(j.lt.0) ishft=rshift(i,-j)
      return
      end
#endif
