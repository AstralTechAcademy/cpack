project(CPackExample)
cmake_minimum_required(VERSION 3.24)

set (CMAKE_CXX_STANDARD 17)
set(APP_NAME CPackExample)

message(CMAKE_SYSTEM_NAME="${CMAKE_SYSTEM_NAME}")
message(${PROJECT_SOURCE_DIR})

if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(MACOSX TRUE)
endif()

set(ASTRALTECH_LIB_TYPE "SHARED")

#############################################
#                                           #
#  INSTALL DIRECTORIES AND RPATH LIBRARIES  #
#                                           #
#############################################

set(CMAKE_INSTALL_PREFIX "/usr/local")
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
set(CMAKE_INSTALL_RPATH "/usr/local/lib")

#############################################
#                                           #
#           CREATE OBJECTS                  #
#                                           #
#############################################

add_library(MyLib ${ASTRALTECH_LIB_TYPE} lib64/src/myLib.cpp lib64/include/myLib.h)
target_include_directories(MyLib PUBLIC "lib64/include")

add_executable(CPackExample MACOSX_BUNDLE src/main.cpp)
target_link_libraries(CPackExample MyLib)

#############################################
#                                           #
#           INSTALL OBJECTS                 #
#                                           #
#############################################


install(TARGETS ${APP_NAME}
    BUNDLE DESTINATION . COMPONENT Runtime
    RUNTIME DESTINATION bin COMPONENT Runtime
    )

# Not required with STATIC libraries. A static library is included inside the app binary
if (${ASTRALTECH_LIB_TYPE} STREQUAL "SHARED")
install(TARGETS MyLib LIBRARY DESTINATION lib COMPONENT lib)
endif()


#############################################
#                                           #
#                CPACK                      #
#                                           #
#############################################

if (UNIX)
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
elseif (MACOSX)
    set(CPACK_PACKAGE_NAME "CPackExample")
    set(CPACK_PACKAGE_VENDOR "Astraltech")
    set(CPACK_PACKAGE_VERSION "1.0.0")
    set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A sample CLI tool")
    set(CPACK_GENERATOR "DragNDrop")
    set(CPACK_PACKAGE_DIRECTORY "${PROJECT_SOURCE_DIR}/bin")
endif ()

include(CPack)