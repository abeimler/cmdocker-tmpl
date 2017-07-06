### TODO avoid file(GLOB)
file(GLOB_RECURSE src ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp ${CMAKE_CURRENT_SOURCE_DIR}/*.cxx ${CMAKE_CURRENT_SOURCE_DIR}/*.cc)
list(REMOVE_ITEM src ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp) # already use it in app


add_library(${PROJECT_NAME}_src STATIC ${src})
add_library(${PROJECT_NAME}.Src ALIAS ${PROJECT_NAME}_src)

set_property(TARGET ${PROJECT_NAME}_src PROPERTY CXX_STANDARD 14)
set_property(TARGET ${PROJECT_NAME}_src PROPERTY CXX_STANDARD_REQUIRED ON)
target_compile_features(${PROJECT_NAME}_src PUBLIC cxx_constexpr 
                                                cxx_aggregate_default_initializers
                                                cxx_auto_type 
                                                cxx_range_for 
                                                cxx_decltype_auto 
                                                cxx_nullptr)
target_compile_features(${PROJECT_NAME}_src PRIVATE cxx_lambdas)

target_include_directories(${PROJECT_NAME}_src PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")

#target_compile_options(${PROJECT_NAME}_src PRIVATE -fexceptions)


# use SYSTEM to get rid of 3rd party libs warnings
##target_include_directories(${PROJECT_NAME} SYSTEM PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/lib/...")
### @NOTE: add 3rd party include here

# app compnents
target_link_libraries(${PROJECT_NAME}_src PUBLIC backend)


target_include_directories(${PROJECT_NAME}_src PUBLIC "${${PROJECT_NAME}_SOURCE_DIR}/include")

unset(src)