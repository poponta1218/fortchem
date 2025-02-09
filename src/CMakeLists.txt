# vim: set ft=cmake:

set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(SRC_FILES
    ${SRC_DIR}/fortchem.f90
    ${SRC_DIR}/kind_params.f90
    ${SRC_DIR}/math_mods.f90
    ${SRC_DIR}/physchem_consts.f90
    ${SRC_DIR}/unit_params.f90
)

target_sources(${LIB_NAME} PRIVATE ${SRC_FILES})
