project(CPackExample)
cmake_minimum_required(VERSION 3.24)

set (CMAKE_CXX_STANDARD 11)

set(APP_NAME CPackExample)

add_library(MyLib STATIC lib64/src/myLib.cpp lib64/include/myLib.h)
target_include_directories(MyLib PUBLIC "lib64/include")

add_executable(CPackExample MACOSX_BUNDLE src/main.cpp)
target_link_libraries(CPackExample MyLib)

install(TARGETS ${APP_NAME}
    BUNDLE DESTINATION . COMPONENT Runtime
    RUNTIME DESTINATION bin COMPONENT Runtime
    )

# Not required with STATIC libraries. A static library is included inside the app binary
#install(TARGETS MyLib ARCHIVE DESTINATION libs COMPONENT libraries)

set(CPACK_PACKAGE_NAME "CPackExample")
set(CPACK_PACKAGE_VENDOR "Astraltech")
set(CPACK_PACKAGE_VERSION "1.0.0")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A sample CLI tool")

set(CPACK_GENERATOR "DragNDrop")
set(CPACK_PACKAGE_DIRECTORY "/Users/gadominguez/Repositorio/cpack/bin")

include(CPack)

