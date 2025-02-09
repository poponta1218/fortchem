! vim: set ft=fortran:
module physchem_consts
  use :: kind_params, only: dp
  implicit none
  ! Unit constants
  real(dp), parameter :: amu = 1822.8880d0
  real(dp), parameter :: au_time = 2.41888433d-17
  real(dp), parameter :: ang2bohr = 1.889726d0
  real(dp), parameter :: bohr2ang = 0.529177209d0
  real(dp), parameter :: kcal2kj = 4.184d0
  real(dp), parameter :: kj2kcal = 1.0d0 / kcal2kj
  real(dp), parameter :: hartree2kcalmol = 627.5095d0
  real(dp), parameter :: hartree2kjmol = 2625.500d0
  real(dp), parameter :: hartree2ev = 27.211386d0
  real(dp), parameter :: hartree2cminv = 219474.63d0
  real(dp), parameter :: kcalmol2hartree = 1.0d0 / hartree2kcalmol
  real(dp), parameter :: kjmol2hartree = 1.0d0 / hartree2kjmol
  real(dp), parameter :: ev2hartree = 1.0d0 / hartree2ev
  real(dp), parameter :: cminv2hartree = 1.0d0 / hartree2cminv

  ! Physical constants
  real(dp), parameter :: pi = acos(-1.0d0)
  real(dp), parameter :: speed_of_light = 299792458.0d0 ! m/s
  real(dp), parameter :: boltzmann = 1.380649d-23 ! J/K
  real(dp), parameter :: planck = 6.62607015d-34 ! J s
  real(dp), parameter :: dirac = planck / (2.0d0 * pi) ! J s
  real(dp), parameter :: avogadro = 6.02214076d23 ! mol^-1
end module physchem_consts
