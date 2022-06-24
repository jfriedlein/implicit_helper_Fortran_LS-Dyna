c########################################################################################
      subroutine hsv_get_6x6_sub(nameX, history, es)
c
      !implicit none
c
      real*8, dimension(6,6), intent(out) :: es
      character(len=5), intent(in) :: nameX
      real*8, intent(in) :: history(*)
      integer :: start_index, end_index
c
      start_index = hsv_get_sth(nameX, 'start_', history)
      end_index =   hsv_get_sth(nameX, 'end__', history)

      if ( hsv_get_sth(nameX, 'length', history) /= 36 ) then
           write(*,*) "hsv_get_6x6_sub<< Selected nameX (",nameX,
     &      " is not a 6x6. Check for typos or choose a different
     &      function that also handles this."
           call cstop('E R R O R  T E R M I N A T I O N')
      endif
c
      es(1:6,1:6)=list_36_to_array_6x6(history(start_index:end_index))
c
      end subroutine hsv_get_6x6_sub


c########################################################################################
      subroutine hsv_get_sym6x6_sub(nameX, history, es)
c
      !implicit none
c
      real*8, dimension(6,6), intent(out) :: es
      character(len=5), intent(in) :: nameX
      real*8, intent(in) :: history(*)
      integer :: start_index, end_index
c
      start_index = hsv_get_sth(nameX, 'start_', history)
      end_index =   hsv_get_sth(nameX, 'end__', history)

      if ( hsv_get_sth(nameX, 'length', history) /= 21 ) then
            write(*,*) "hsv_get_sym6x6_sub<< Selected nameX (",nameX,
     & " is not a symmetric 6x6. Check for typos or choose a 
     & different function that also handles this."
            call cstop('E R R O R  T E R M I N A T I O N')
      endif
c
      es(1:6,1:6) = list_21_to_array_sym6x6(
     &                         history(start_index:end_index) )
c
      end subroutine hsv_get_sym6x6_sub
      
c########################################################################################

      function hsv_get_6x6(nameX, history)
c
      use Tensor
      !implicit none
c
      real*8, dimension(6,6) :: hsv_get_6x6
      character(len=5), intent(in) :: nameX
      real*8, intent(in) :: history(*)
      integer :: start_index, end_index
c
      start_index = hsv_get_sth(nameX, 'start_', history)
      end_index =   hsv_get_sth(nameX, 'end__', history)

      if ( hsv_get_sth(nameX, 'length', history) /= 36 ) then
           write(*,*) "hsv_get_6x6<< Selected nameX (",nameX,
     &      " is not a 6x6. Check for typos or choose a different
     &      function that also handles this."
            call cstop('E R R O R  T E R M I N A T I O N')
      endif
c
      hsv_get_6x6=list_36_to_array_6x6(history(start_index:end_index))
c
      end function hsv_get_6x6

c 
