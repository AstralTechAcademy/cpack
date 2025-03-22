if (${CMAKE_SYSTEM_NAME} MATCHES "Windows")
add_executable(CPackExample WIN32 src/main.cpp)
endif()