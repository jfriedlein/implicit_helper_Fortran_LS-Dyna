!DEC$ IF .NOT. DEFINED (implicit_helper_F)
!DEC$ DEFINE implicit_helper_F
! -----------MODULE implicit_helper----------------------------

      module implicit_helper

      use Tensor
      use TensorXLSDYNA ! needed for "hsv_manager_mp_hsv_get_6x6_", ...
      use hsv_manager
c Usage

      
      contains

!      ------BEGIN FUNCTIONS-------------------------------------
       include './hsv_get_6x6.f'
       include './get_utan_from_hsv.f'
       include './stiffnessArray4_to_LSD6x6.f'
c
      end module implicit_helper
!DEC$ ENDIF
