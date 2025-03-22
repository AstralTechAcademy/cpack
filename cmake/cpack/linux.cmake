if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    set(LINUX TRUE)


#############################################
#                                           #
#  INSTALL DIRECTORIES AND RPATH LIBRARIES  #
#                                           #
#############################################

set(CMAKE_INSTALL_PREFIX "/usr/local")
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
set(CMAKE_INSTALL_RPATH "/usr/local/lib")

# The content of the deb package will be extracted into this directory, keeping the same tree directory as the DEB package.
set(CPACK_PACKAGING_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# DEB package output location
set(CPACK_PACKAGE_DIRECTORY "${PROJECT_SOURCE_DIR}/bin")

set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Astraltech")
set(CPACK_DEBIAN_PACKAGE_NAME "CPackExample")
set(CPACK_DEBIAN_PACKAGE_VERSION "1.0.0")
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "CPackExample")
set(CPACK_DEBIAN_FILE_NAME "${CPACK_DEBIAN_PACKAGE_NAME}-${CPACK_DEBIAN_PACKAGE_VERSION}-${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}.deb")
set(CPACK_GENERATOR "DEB")

set(CPACK_DEBIAN_PACKAGE_DEPENDS "libMyLib")
endif()