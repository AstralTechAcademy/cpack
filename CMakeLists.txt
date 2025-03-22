project(CPackExample)
cmake_minimum_required(VERSION 3.24)

set (CMAKE_CXX_STANDARD 17)
set(APP_NAME CPackExample)

message(CMAKE_SYSTEM_NAME="${CMAKE_SYSTEM_NAME}")
message(${PROJECT_SOURCE_DIR})

include(cmake/arch/macos.cmake)
include(cmake/arch/linux.cmake)
include(cmake/arch/windows.cmake)

set(ASTRALTECH_LIB_TYPE "SHARED")

#############################################
#                                           #
#           CREATE OBJECTS                  #
#                                           #
#############################################

add_library(MyLib ${ASTRALTECH_LIB_TYPE} lib64/src/myLib.cpp lib64/include/myLib.h)
target_include_directories(MyLib PUBLIC "lib64/include")

include(cmake/obj/macos.cmake)
include(cmake/obj/windows.cmake)
include(cmake/obj/linux.cmake)

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

include(cmake/cpack/macos.cmake)
include(cmake/cpack/linux.cmake)