! vim: set ft=fortran:
module fortchem
  use :: kind_params, only: i32, dp
  use :: unit_params, only: stdin, stdout
  use :: physchem_consts, only: pi
  use :: math_mods, only: cross_product
  implicit none
contains
  subroutine distance(coord, atom1, atom2, dist)
    implicit none
    integer(i32), intent(in) :: atom1, atom2
    real(dp), intent(in) :: coord(:, :)
    real(dp), intent(out) :: dist

    dist = sqrt(sum((coord(:, atom1) - coord(:, atom2)) ** 2))
  end subroutine distance

  subroutine angle(coord, atom1, atom2, atom3, theta)
    implicit none
    integer(i32), intent(in) :: atom1, atom2, atom3
    real(dp), intent(in) :: coord(:, :)
    real(dp), intent(out) :: theta

    real(dp) :: vec1(3), vec2(3)

    vec1 = coord(:, atom1) - coord(:, atom2)
    vec2 = coord(:, atom3) - coord(:, atom2)
    theta = acos(dot_product(vec1, vec2) / (norm2(vec1) * norm2(vec2))) * 180.0d0 / pi
  end subroutine angle

  subroutine dihedral(coord, atom1, atom2, atom3, atom4, phi)
    implicit none
    integer(i32), intent(in) :: atom1, atom2, atom3, atom4
    real(dp), intent(in) :: coord(:, :)
    real(dp), intent(out) :: phi

    real(dp) :: vec1(3), vec2(3), vec3(3), cross1(3), cross2(3)

    vec1 = coord(:, atom2) - coord(:, atom1)
    vec2 = coord(:, atom3) - coord(:, atom2)
    vec3 = coord(:, atom4) - coord(:, atom3)

    cross1 = cross_product(vec1, vec2)
    cross2 = cross_product(vec2, vec3)
    phi = acos(dot_product(cross1, cross2) / (norm2(cross1) * norm2(cross2))) * 180.0d0 / pi
  end subroutine dihedral

  subroutine get_struc(geomunit, natom, nbead, atomname, xcoord, vcoord, fcoord, epot)
    implicit none
    character(len=*), intent(out) :: atomname(:, :)
    integer(i32), intent(in) :: geomunit, natom, nbead
    real(dp), intent(out) :: xcoord(:, :, :), vcoord(:, :, :), fcoord(:, :, :)
    real(dp), intent(out) :: epot

    integer(i32) :: i, iatom, ibead
    integer(i32) :: ios

    do ibead=1, nbead
      do iatom=1, natom
        do while (.true.)
          read(geomunit, *, iostat=ios) &
              atomname(iatom, ibead), &
              (xcoord(i, iatom, ibead), i=1, 3), &
              (vcoord(i, iatom, ibead), i=1, 3), &
              (fcoord(i, iatom, ibead), i=1, 3), epot
          if (ios /= 0) then
            read(geomunit, *, iostat=ios) &
                atomname(iatom, ibead), &
                (xcoord(i, iatom, ibead), i=1, 3), &
                (vcoord(i, iatom, ibead), i=1, 3)
            if (ios /= 0) then
              read(geomunit, *, iostat=ios) &
                  atomname(iatom, ibead), &
                  (xcoord(i, iatom, ibead), i=1, 3)
              if (ios /= 0) then
                read(geomunit)
              end if
            end if
          else
            exit
          end if
        end do
      end do
    end do
  end subroutine get_struc

  subroutine centroid(coord, cent)
    implicit none
    real(dp), intent(in) :: coord(:, :, :)
    real(dp), intent(out) :: cent(:, :)

    integer(i32) :: iatom, ibead, natom, nbead

    natom = size(coord, 2)
    nbead = size(coord, 3)

    cent(:, :) = 0.0d0
    do ibead=1, nbead
      do iatom=1, size(coord, 2)
        cent(:, iatom) = cent(:, iatom) + coord(:, iatom, ibead)
      end do
    end do
    cent(:, :) = cent(:, :) / nbead
  end subroutine centroid

  function atom2mass(atom) result(mass)
    implicit none
    character(len=*), intent(in) :: atom
    real(dp) :: mass

    select case (trim(adjustl(atom)))
      case ("1", "H", "h")
        mass = 1.00782503223d0
      case ("2", "He", "he")
        mass = 4.00260325413d0
      case ("3", "Li", "li")
        mass = 7.0160034366d0
      case ("4", "Be", "be")
        mass = 9.012183065d0
      case ("5", "B", "b")
        mass = 10.811d0
      case ("6", "C", "c")
        mass = 12.000000000d0
      case ("7", "N", "n")
        mass = 14.00307400443d0
      case ("8", "O", "o")
        mass = 15.99491461957d0
      case ("9", "F", "f")
        mass = 18.99840316273d0
      case ("10", "Ne", "ne")
        mass = 19.9924401762d0
      case ("11", "Na", "na")
        mass = 22.9897692820d0
      case ("12", "Mg", "mg")
        mass = 24.3055d0
      case ("13", "Al", "al")
        mass = 26.98153853d0
      case ("14", "Si", "si")
        mass = 27.97692653465d0
      case ("15", "P", "p")
        mass = 30.97376199842d0
      case ("16", "S", "s")
        mass = 31.9720711744d0
      case ("17", "Cl", "cl")
        mass = 35.4515d0
      case ("18", "Ar", "ar")
        mass = 39.9623831237d0
      case ("19", "K", "k")
        mass = 38.9637064864d0
      case ("20", "Ca", "ca")
        mass = 39.962590863d0
      case ("21", "Sc", "sc")
        mass = 44.95590828d0
      case ("22", "Ti", "ti")
        mass = 47.867d0
      case ("23", "V", "v")
        mass = 50.94395704d0
      case ("24", "Cr", "cr")
        mass = 51.9961d0
      case ("25", "Mn", "mv")
        mass = 54.93804391d0
      case ("26", "Fe", "fe")
        mass = 55.845d0
      case ("27", "Co", "co")
        mass = 58.93319429d0
      case ("28", "Ni", "ni")
        mass = 58.6934d0
      case ("29", "Cu", "cu")
        mass = 63.546d0
      case ("30", "Zn", "zn")
        mass = 65.38d0
      case ("31", "Ga", "ga")
        mass = 69.723d0
      case ("32", "Ge", "ge")
        mass = 72.630d0
      case ("33", "As", "as")
        mass = 74.92159457d0
      case ("34", "Se", "se")
        mass = 78.971d0
      case ("35", "Br", "br")
        mass = 79.904d0
      case ("36", "Kr", "kr")
        mass = 83.798d0
    end select
  end function atom2mass
end module fortchem
