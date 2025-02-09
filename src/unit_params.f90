! vim: set ft=fortran:
module unit_params
  use, intrinsic :: iso_fortran_env, only: input_unit, output_unit, error_unit
  implicit none
  integer, parameter :: stdin = input_unit
  integer, parameter :: stdout = output_unit
  integer, parameter :: stderr = error_unit
end module unit_params
