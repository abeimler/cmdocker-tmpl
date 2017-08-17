cmake_minimum_required (VERSION 3.3 FATAL_ERROR)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${${PROJECT_NAME}_BINARY_DIR}")

include(CTest)

enable_testing()
option(BUILD_BENCHMARKING "Build Benchmarks" OFF)


###
## (global) 3rd party libs for testing, benchmark, ...
###
if(BUILD_TESTING)
  add_subdirectory(libs/doctest)
endif()
if(BUILD_BENCHMARKING)
  ## header-only lib
  #add_subdirectory(libs/benchpress)
endif()




###
## sub dirs
## @NOTE: add_subdirectories here (app components)
###
add_subdirectory(backend)
add_subdirectory(app)

