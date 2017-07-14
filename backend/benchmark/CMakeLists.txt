### TODO avoid file(GLOB)
file(GLOB_RECURSE src ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp ${CMAKE_CURRENT_SOURCE_DIR}/*.cxx ${CMAKE_CURRENT_SOURCE_DIR}/*.cc)

add_library(${PROJECT_NAME}_benchmark STATIC ${src})
add_library(${PROJECT_NAME}.Benchmark ALIAS ${PROJECT_NAME}_benchmark)

set_property(TARGET ${PROJECT_NAME}_benchmark PROPERTY CXX_STANDARD 14)
set_property(TARGET ${PROJECT_NAME}_benchmark PROPERTY CXX_STANDARD_REQUIRED ON)
target_compile_features(${PROJECT_NAME}_benchmark PUBLIC cxx_constexpr 
                                                cxx_aggregate_default_initializers
                                                cxx_auto_type 
                                                cxx_range_for 
                                                cxx_decltype_auto 
                                                cxx_nullptr
                                                cxx_lambdas cxx_raw_string_literals cxx_user_literals)


target_include_directories(${PROJECT_NAME}_benchmark PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

target_compile_options(${PROJECT_NAME}_benchmark PRIVATE -fexceptions)
target_link_libraries (${PROJECT_NAME}_benchmark PRIVATE Threads::Threads)


target_include_directories(${PROJECT_NAME}_benchmark SYSTEM PUBLIC "${CMAKE_SOURCE_DIR}/lib/benchpress/src")

target_link_libraries(${PROJECT_NAME}_benchmark PUBLIC ${PROJECT_NAME})
#target_link_libraries(${PROJECT_NAME}_benchmark PUBLIC benchpress) # header-only

unset(src)