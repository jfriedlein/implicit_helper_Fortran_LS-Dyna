        function stiffnessArray4_to_LSD6x6(Array4)
        ! Transform a fourth order stiffness tensor to its
        ! LS-Dyna 6x6 "es" matrix representation.
        ! @note LS-Dyna vector notation (11,22,33,12,23,31)
        !       is different from Voigt (11,22,33,23,13,12)
        ! @test compared for anisotropic non-associative 4th order tensor (presumably non-sym matrix)
c
        implicit none
c
        real(kind=8), dimension(6,6) :: stiffnessArray4_to_LSD6x6
        ! Fourth order input tensor
         real*8, dimension(3,3,3,3), intent(in) :: Array4
        ! Auxiliary variable to store data from "stiffnessArray4_to_LSD6x6"
        ! only used because the function name is so long and cumbersome
         real(kind=8), dimension(6,6) :: LSD_6x6
        ! i: iteration index for "do"-loops
         integer i
        ! Scaling factors for components of tensor to matrix (scaleT_*)
         real(kind=8) scaleT_14, scaleT_44
        ! Define the scaling factors for the conversion from tensor to LS-Dyna matrix
        ! @note The following was created based on trial-error and is "NOT verified"
        ! @todo Why do we need 0.5 on certain values?
        !  This factor does not only affect unsym non-associative plasticity, but also improves Hill48 plasticity under 45°, ...
         scaleT_14 = 0.5d0
         scaleT_44 = 1.d0
c
        ! Fill first three rows
         do i=1,3
            LSD_6x6(i,1) = Array4(i,i,1,1)
            LSD_6x6(i,2) = Array4(i,i,2,2)
            LSD_6x6(i,3) = Array4(i,i,3,3)
            LSD_6x6(i,5) = scaleT_14*Array4(i,i,2,3)
            LSD_6x6(i,6) = scaleT_14*Array4(i,i,1,3)
            LSD_6x6(i,4) = scaleT_14*Array4(i,i,1,2)
         end do
c
        ! Fill fourth row
         LSD_6x6(4,1) = scaleT_14*Array4(1,2,1,1)
         LSD_6x6(4,2) = scaleT_14*Array4(1,2,2,2)
         LSD_6x6(4,3) = scaleT_14*Array4(1,2,3,3)
         LSD_6x6(4,5) = scaleT_44*Array4(1,2,2,3)
         LSD_6x6(4,6) = scaleT_44*Array4(1,2,1,3)
         LSD_6x6(4,4) = scaleT_44*Array4(1,2,1,2)    
c
        ! Fill fifth row
         LSD_6x6(5,1) = scaleT_14*Array4(2,3,1,1)
         LSD_6x6(5,2) = scaleT_14*Array4(2,3,2,2)
         LSD_6x6(5,3) = scaleT_14*Array4(2,3,3,3)
         LSD_6x6(5,5) = scaleT_44*Array4(2,3,2,3)
         LSD_6x6(5,6) = scaleT_44*Array4(2,3,1,3)
         LSD_6x6(5,4) = scaleT_44*Array4(2,3,1,2)
c
        ! Fill sixth row
         LSD_6x6(6,1) = scaleT_14*Array4(1,3,1,1)
         LSD_6x6(6,2) = scaleT_14*Array4(1,3,2,2)
         LSD_6x6(6,3) = scaleT_14*Array4(1,3,3,3)
         LSD_6x6(6,5) = scaleT_44*Array4(1,3,2,3)
         LSD_6x6(6,6) = scaleT_44*Array4(1,3,1,3)
         LSD_6x6(6,4) = scaleT_44*Array4(1,3,1,2)
c
c Copy the 6x6 matrix into the output variable
        stiffnessArray4_to_LSD6x6 = LSD_6x6
c
       end function stiffnessArray4_to_LSD6x6
