add_library(${PROJECT_NAME}_test_main STATIC ${CMAKE_CURRENT_SOURCE_DIR}/mainTest.cpp)
add_library(${PROJECT_NAME}.Test::Main ALIAS ${PROJECT_NAME}_test_main)


target_compile_features(${PROJECT_NAME}_test_main PRIVATE cxx_constexpr 
                                                cxx_aggregate_default_initializers
                                                cxx_auto_type 
                                                cxx_range_for 
                                                cxx_decltype_auto 
                                                cxx_nullptr
                                                cxx_lambdas)


target_compile_options(${PROJECT_NAME}_test_main PUBLIC -fexceptions)
target_link_libraries (${PROJECT_NAME}_test_main PUBLIC Threads::Threads)

target_link_libraries(${PROJECT_NAME}_test_main PUBLIC ${PROJECT_NAME}_src)
target_link_libraries(${PROJECT_NAME}_test_main PUBLIC doctest)
 


### TODO avoid file(GLOB)
file(GLOB_RECURSE src ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp ${CMAKE_CURRENT_SOURCE_DIR}/*.cxx ${CMAKE_CURRENT_SOURCE_DIR}/*.cc)
list(REMOVE_ITEM src ${CMAKE_CURRENT_SOURCE_DIR}/mainTest.cpp) # already use it in Test.Main


foreach(src_file ${src})

    get_filename_component(src_file_base_name "${src_file}" NAME)
    string(REPLACE ".cpp" "" src_file_base_name ${src_file_base_name})
    string(REPLACE ".cxx" "" src_file_base_name ${src_file_base_name})
    string(REPLACE ".cc"  "" src_file_base_name ${src_file_base_name})
    set(test_name "${PROJECT_NAME}.${src_file_base_name}.Test")
    set(test_command "${PROJECT_NAME}_${src_file_base_name}_test")

    
    add_executable(${test_command} ${src_file})
    add_executable(${test_name} ALIAS ${test_command})

    target_include_directories(${test_command} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")

    set_property(TARGET ${test_command} PROPERTY CXX_STANDARD 14)
    set_property(TARGET ${test_command} PROPERTY CXX_STANDARD_REQUIRED ON)

    target_link_libraries (${test_command} PRIVATE ${PROJECT_NAME}_test_main)

    add_test(NAME "${test_name}" COMMAND ${test_command}
             WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
    #add_test(NAME ${test_name} COMMAND ${test_command} 
    #         WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    #         --config $<CONFIGURATION> --exe $<TARGET_FILE:${test_command}>)
endforeach()

unset(test_name)
unset(test_command)


unset(src)

unset(src)