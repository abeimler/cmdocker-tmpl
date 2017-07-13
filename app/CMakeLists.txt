cmake_minimum_required (VERSION 3.3 FATAL_ERROR)

file(READ ${CMAKE_SOURCE_DIR}/VERSION ver)
project(MyApp VERSION ${ver} LANGUAGES CXX) # @TODO change project-name


###
## 3rd libs
## @NOTE: add_subdirectory/libs here 
###

##
# add boost
##

set(Boost_USE_STATIC_LIBS    ON)
set(Boost_USE_MULTITHREADED  ON)
set(Boost_USE_STATIC_RUNTIME OFF)
find_package(Boost 1.60.0 COMPONENTS date_time serialization filesystem system)



###
## Application Build
###
add_subdirectory(src)



###
## Application (exe)
###

## application with main
add_executable(${PROJECT_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE ${PROJECT_NAME}_src)





###
## Test Application build
###
if(BUILD_TESTING)
  add_subdirectory(test)
endif()




###
## Benchmark Application build
###
if(BUILD_BENCHMARKING)
### @TODO make benchmarks for main app, if you need
#  add_subdirectory(benchmark)
endif()


