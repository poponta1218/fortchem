! vim: set ft=fortran:
module math_mods
  use :: kind_params, only: dp
  implicit none
contains
  function cross_product(vec1, vec2) result(cross)
    implicit none
    real(dp), intent(in) :: vec1(3), vec2(3)
    real(dp) :: cross(3)

    cross(1) = vec1(2) * vec2(3) - vec1(3) * vec2(2)
    cross(2) = vec1(3) * vec2(1) - vec1(1) * vec2(3)
    cross(3) = vec1(1) * vec2(2) - vec1(2) * vec2(1)
  end function cross_product
end module math_mods
