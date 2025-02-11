# vim: set ft=cmake:

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    if(UNIX OR APPLE)
        set_property(CACHE CMAKE_INSTALL_PREFIX PROPERTY VALUE "/usr/local")
    elseif(WIN32)
        set_property(CACHE CMAKE_INSTALL_PREFIX PROPERTY VALUE "C:/Program Files/fortchem")
    endif()
endif()
