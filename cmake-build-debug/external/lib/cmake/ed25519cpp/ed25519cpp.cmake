add_library(${PROJECT_LIB} STATIC IMPORTED)


find_library(${PROJECT_LIB}_LIBRARY_PATH ${PROJECT_LIB} HINTS "${CMAKE_CURRENT_LIST_DIR}/../../")
set_target_properties(${PROJECT_LIB} PROPERTIES IMPORTED_LOCATION "${ed25519cpp_LIBRARY_PATH}")

include_directories(
        "${ed25519cpp_INCLUDE_PATH}"
)

message(STATUS "CMAKE_CURRENT_LIST_DIR"  ${CMAKE_CURRENT_LIST_DIR})
message(STATUS "CMAKE_INSTALL_PREFIX " ${CMAKE_INSTALL_PREFIX})
message(STATUS "milecsa_LIBRARY_PATH " ${ed25519cpp_LIB_LIBRARY_PATH})
message(STATUS "milecsa_INCLUDE_PATH " ${ed25519cpp_LIB_INCLUDE_PATH})
