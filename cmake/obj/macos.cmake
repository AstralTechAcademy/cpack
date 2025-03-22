if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
add_executable(CPackExample MACOSX_BUNDLE src/main.cpp)
endif()