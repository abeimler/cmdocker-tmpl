cmake_minimum_required (VERSION 3.3 FATAL_ERROR)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/VERSION ver)
project(backend VERSION ${ver} LANGUAGES CXX)


###
## 3rd libs
## @NOTE: add_subdirectory libs here 
###

## header-only @TODO did header-only libs need to add_subdirectory, EXCLUDE_FROM_ALL for 3rd-party ?
add_subdirectory(libs/entt EXCLUDE_FROM_ALL)
add_subdirectory(libs/eventpp EXCLUDE_FROM_ALL)

add_subdirectory(libs/json EXCLUDE_FROM_ALL)
add_subdirectory(libs/cereal EXCLUDE_FROM_ALL)



###
## Backend Build
###
add_subdirectory(src)




###
## Test Backend build
###
if(BUILD_TESTING)
  add_subdirectory(test)
endif()




###
## Benchmark Backend build
###
if(BUILD_BENCHMARKING)
  add_subdirectory(benchmark)
endif()


