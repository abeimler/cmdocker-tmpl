cmake_minimum_required (VERSION 3.3 FATAL_ERROR)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${${PROJECT_NAME}_BINARY_DIR}")

include(CTest)

enable_testing()
option(BUILD_BENCHMARKING "Build Benchmarks" OFF)


###
## (global) 3rd party libs for testing, benchmark, ...
###
if(BUILD_TESTING)
  ## heady-only
  add_subdirectory(lib/doctest)
endif()
if(BUILD_BENCHMARKING)
  ## heady-only
  add_subdirectory(lib/benchpress)
endif()




###
## sub dirs
## @NOTE: add_subdirectory here (app components)
###
add_subdirectory(backend)
add_subdirectory(app)

