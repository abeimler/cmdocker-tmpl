### @TODO: avoid file(GLOB)
add_library(${PROJECT_NAME}_benchmark_main STATIC ${CMAKE_CURRENT_SOURCE_DIR}/mainBenchmark.cpp)
add_library(${PROJECT_NAME}.Benchmark::Main ALIAS ${PROJECT_NAME}_benchmark_main)


target_compile_features(${PROJECT_NAME}_benchmark_main PRIVATE cxx_auto_type 
                                                cxx_range_for 
                                                cxx_nullptr
                                                cxx_lambdas 
                                                cxx_raw_string_literals cxx_user_literals)


target_include_directories(${PROJECT_NAME}_benchmark_main PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")

target_compile_options(${PROJECT_NAME}_benchmark_main PUBLIC -fexceptions)
target_link_libraries (${PROJECT_NAME}_benchmark_main PUBLIC Threads::Threads)


target_include_directories(${PROJECT_NAME}_benchmark_main PUBLIC "${CMAKE_SOURCE_DIR}/libs/benchpress/src/benchpress")
target_link_libraries(${PROJECT_NAME}_benchmark_main PUBLIC benchpress) ## header-only



### @TODO: avoid file(GLOB)
file(GLOB_RECURSE src ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp ${CMAKE_CURRENT_SOURCE_DIR}/*.cxx ${CMAKE_CURRENT_SOURCE_DIR}/*.cc)
list(REMOVE_ITEM src ${CMAKE_CURRENT_SOURCE_DIR}/mainBenchmark.cpp) # already use it in Benchmark.Main

add_library(${PROJECT_NAME}_benchmark STATIC ${src})
add_library(${PROJECT_NAME}.Benchmark ALIAS ${PROJECT_NAME}_benchmark)

target_include_directories(${PROJECT_NAME}_benchmark PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(${PROJECT_NAME}_benchmark PUBLIC ${PROJECT_NAME})
target_link_libraries(${PROJECT_NAME}_benchmark PUBLIC ${PROJECT_NAME}_benchmark_main)


unset(src)