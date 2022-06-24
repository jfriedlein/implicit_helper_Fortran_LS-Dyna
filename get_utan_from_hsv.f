c
      subroutine get_utan_from_hsv(cm,eps,sig,epsp,hsv,
     & dt1,unsym,capa,etype,tt,
     & temper,es,crv,nnpcrv,failel,cma,qmat)
c
      include 'nlqparm'
c
      real*8, dimension(*), intent(in) :: hsv
      dimension cm(*),eps(*),sig(*),crv(lq1,2,*),cma(*)
      integer nnpcrv(*)
      real*8, dimension(6,*), intent(out) :: es(6,*)
      dimension qmat(3,3)
      logical failel,unsym
      character*5 etype
c
      !es(1:6,1:6) = hsv_get_6x6('es___', hsv)
      !call hsv_get_6x6_sub('es___', hsv, es)
      call hsv_get_sym6x6_sub('esSYM', hsv, es)
c
      return
      end
