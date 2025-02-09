# vim: set ft=cmake:

if (CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
    LIST(APPEND FCOPTS
        "O2"
        "ffree-form"
        "ffree-line-length-132"
        "g"
        "Wall"
    )
elseif (CMAKE_Fortran_COMPILER_ID STREQUAL "Intel")
    LIST(APPEND FCOPTS
        "O2"
        "free"
        "extend-source"
        "g"
        "warn all"
    )
elseif (CMAKE_Fortran_COMPILER_ID STREQUAL "Flang")
    LIST(APPEND FCOPTS
        "O2"
        "Mfreeform"
        "Mextend"
        "g"
        "Wall"
    )
endif()

if (WIN32)
    LIST(TRANSFORM FCOPTS PREPEND "/")
elseif (APPLE)
    LIST(TRANSFORM FCOPTS PREPEND "-")
elseif (UNIX)
    LIST(TRANSFORM FCOPTS PREPEND "-")
endif()
