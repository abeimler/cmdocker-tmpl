### @TODO: avoid file(GLOB)
file(GLOB_RECURSE src ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp ${CMAKE_CURRENT_SOURCE_DIR}/*.cxx ${CMAKE_CURRENT_SOURCE_DIR}/*.cc)

add_library(${PROJECT_NAME} STATIC ${src})
add_library(MyApp::Backend ALIAS ${PROJECT_NAME}) ### @TODO: change namespace

target_compile_features(${PROJECT_NAME} PUBLIC cxx_constexpr 
                                                cxx_aggregate_default_initializers
                                                cxx_auto_type 
                                                cxx_range_for 
                                                cxx_decltype_auto 
                                                cxx_nullptr
                                                cxx_lambdas)

target_include_directories(${PROJECT_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")

#target_compile_options(${PROJECT_NAME} PRIVATE -fno-exceptions)


# use SYSTEM to get rid of 3rd-party libs warnings
### @NOTE: add libs here

## add include_directories from header-only libs
target_include_directories(${PROJECT_NAME} SYSTEM PUBLIC "${${PROJECT_NAME}_SOURCE_DIR}/libs/better-enums")
target_include_directories(${PROJECT_NAME} SYSTEM PUBLIC "${${PROJECT_NAME}_SOURCE_DIR}/libs/better-enums/extra")
target_include_directories(${PROJECT_NAME} SYSTEM PUBLIC "${${PROJECT_NAME}_SOURCE_DIR}/libs/cereal/include")
target_include_directories(${PROJECT_NAME} SYSTEM PUBLIC "${${PROJECT_NAME}_SOURCE_DIR}/libs/clamp")
target_include_directories(${PROJECT_NAME} SYSTEM PUBLIC "${${PROJECT_NAME}_SOURCE_DIR}/libs/json/src")

target_include_directories(${PROJECT_NAME} SYSTEM PUBLIC "${${PROJECT_NAME}_SOURCE_DIR}/libs/entt/src")
target_include_directories(${PROJECT_NAME} SYSTEM PUBLIC "${${PROJECT_NAME}_SOURCE_DIR}/libs/eventpp/src")


target_include_directories(${PROJECT_NAME} PUBLIC "${${PROJECT_NAME}_SOURCE_DIR}/include")

unset(src)