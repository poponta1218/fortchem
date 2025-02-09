# vim: set ft=cmake:

cmake_minimum_required(VERSION 3.15)

project(fortchem
    VERSION 0.1.0
    DESCRIPTION "A library for chemistry written in Fortran"
    LANGUAGES Fortran
)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(set_options)

set(LIB_NAME fortchem)
set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib)
set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)

add_library(${LIB_NAME})
set_target_properties(${LIB_NAME} PROPERTIES
    Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mod
    RUNTIME_OUTPUT_DIRECTORY ${LIB_DIR}
    LIBRARY_OUTPUT_DIRECTORY ${LIB_DIR}
    ARCHIVE_OUTPUT_DIRECTORY ${LIB_DIR}
)

target_compile_options(${LIB_NAME} PRIVATE ${FCOPTS})

add_subdirectory(src)

install(TARGETS ${LIB_NAME}
    ARCHIVE DESTINATION ${LIB_DIR}
    LIBRARY DESTINATION ${LIB_DIR}
    RUNTIME DESTINATION ${LIB_DIR}
)

install(DIRECTORY ${CMAKE_BINARY_DIR}/mod/
    DESTINATION ${INCLUDE_DIR}
    FILES_MATCHING PATTERN "*.mod"
)
