# The Lib Prefix
if (UNIX)
  set(LIB_PFX "lib")
  if (APPLE)
    set(LIB_EXT ".dylib")
  else ()
    set(LIB_EXT ".so")
  endif ()
else (UNIX)
  set(LIB_PFX "")
  set(LIB_EXT ".dll")
endif (UNIX)

message(STATUS "")
message(STATUS "********* build-environment-detected ***********")


# The Compilter ID
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" OR "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
  set(COMPILER.Clang 1)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  set(COMPILER.Gcc 1)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  set(COMPILER.MSVC 1)
else()
  message (FATAL_ERROR "Compiler ${CMAKE_CXX_COMPILER_ID} not configured")
endif()
message(STATUS "\tCompiler: \t ${CMAKE_CXX_COMPILER_ID}")

if(MSVC)
  string(TOLOWER ${MSVC_CXX_ARCHITECTURE_ID} CMAKE_SYSTEM_PROCESSOR)
  set(CMAKE_SYSTEM_PROCESSOR ${MSVC_CXX_ARCHITECTURE_ID})
endif()

string(TOLOWER ${CMAKE_SYSTEM_PROCESSOR} CMAKE_SYSTEM_PROCESSOR)

message(STATUS "\tProcessor:\t ${CMAKE_SYSTEM_PROCESSOR}")
message(STATUS "\tSystem:   \t ${CMAKE_SYSTEM_NAME}")
if (NOT CMAKE_SYSTEM_PROCESSOR STREQUAL CMAKE_HOST_SYSTEM_PROCESSOR)
  message(STATUS "\tHost processor:\t ${CMAKE_HOST_SYSTEM_PROCESSOR}")
endif()
if (NOT CMAKE_SYSTEM_NAME STREQUAL CMAKE_HOST_SYSTEM_NAME)
  message(STATUS "\tHost system   :\t ${CMAKE_HOST_SYSTEM_NAME}")
endif()
message(STATUS "***************************************")
message(STATUS "")
