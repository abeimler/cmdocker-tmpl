set(CTEST_CHANGE_ID "$ENV{CHANGE_ID}")

set(CTEST_SOURCE_DIRECTORY "$ENV{SOURCE_PATH}")
set(CTEST_BINARY_DIRECTORY "$ENV{BUILD_PATH}")

set(CLEAN_BUILD "$ENV{CLEAN_BUILD}")
set(SUBMIT_RESULTS "$ENV{SUBMIT_RESULTS}")
set(RUN_TESTS "$ENV{RUN_TESTS}")

if(CLEAN_BUILD)
  ctest_empty_binary_directory(${CTEST_BINARY_DIRECTORY})
endif()

site_name(CTEST_SITE)
set(CTEST_BUILD_NAME "$ENV{BUILD_NAME}")

set(CTEST_CUSTOM_MAXIMUM_NUMBER_OF_WARNINGS 1000)
set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
#set(CTEST_USE_LAUNCHERS 1)

set(CTEST_COVERAGE_COMMAND "$ENV{CTEST_COVERAGE_COMMAND}")
set(CTEST_MEMORYCHECK_COMMAND "$ENV{CTEST_MEMORYCHECK_COMMAND}")
set(CTEST_MEMORYCHECK_TYPE "$ENV{CTEST_MEMORYCHECK_TYPE}")

ctest_start("$ENV{BUILD_MODEL}")

ctest_configure()
if(SUBMIT_RESULTS)
  ctest_submit(PARTS Configure)
endif()

ctest_build()
if(SUBMIT_RESULTS)
  ctest_submit(PARTS Build)
endif()


if(RUN_TESTS)
    ctest_test()
    if(SUBMIT_RESULTS)
        ctest_submit(PARTS Test)
    endif()

    if(CTEST_COVERAGE_COMMAND)
        ctest_coverage()
        if(SUBMIT_RESULTS)
            ctest_submit(PARTS Coverage)
        endif()
    endif()

    if(CTEST_MEMORYCHECK_COMMAND OR CTEST_MEMORYCHECK_TYPE)
        ctest_memcheck()
        if(SUBMIT_RESULTS)
            ctest_submit(PARTS MemCheck)
        endif()
    endif()
endif()