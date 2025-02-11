# vim: set ft=cmake:

cmake_minimum_required(VERSION 3.15)

project(fortchem
    VERSION 0.1.0
    DESCRIPTION "A library for chemistry written in Fortran"
    LANGUAGES Fortran
)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
include(set_options)
include(install_prefix)

add_library(fortchem)
set_target_properties(fortchem PROPERTIES
    Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/include
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
)

target_compile_options(fortchem PRIVATE ${FCOPTS})

add_subdirectory(src)

install(TARGETS fortchem
    ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
)

install(DIRECTORY ${CMAKE_BINARY_DIR}/include/
    DESTINATION ${CMAKE_INSTALL_PREFIX}/include
    FILES_MATCHING PATTERN "*.mod"
)
