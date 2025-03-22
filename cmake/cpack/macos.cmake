if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(MACOSX TRUE)

set(CPACK_PACKAGE_NAME "CPackExample")
set(CPACK_PACKAGE_VENDOR "Astraltech")
set(CPACK_PACKAGE_VERSION "1.0.0")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A sample CLI tool")
set(CPACK_GENERATOR "DragNDrop")
set(CPACK_PACKAGE_DIRECTORY "${PROJECT_SOURCE_DIR}/bin")
endif()