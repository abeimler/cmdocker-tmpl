
set(BUILD_NAME "local")
set(BUILD_MODEL "Experimental")
set(CHANGE_ID "$(git rev-parse --verify HEAD)")
set(CTEST_COVERAGE_COMMAND "gcov")
set(CTEST_MEMORYCHECK_COMMAND "")
set(CTEST_MEMORYCHECK_TYPE "")
set(SUBMIT_RESULTS 0)
set(BUILD_PACKAGES 0)

set(BUILD_CONFIG Release)
set(BUILD_PATH ./local)
set(SOURCE_PATH ..)
set(PREFIX_PATH ./prefix)
set(RUN_TESTS 1)
set(CLEAN_BUILD 0)



set(CTEST_CHANGE_ID "${CHANGE_ID}")

set(CTEST_SOURCE_DIRECTORY "${SOURCE_PATH}")
set(CTEST_BINARY_DIRECTORY "${BUILD_PATH}")

set(CLEAN_BUILD "${CLEAN_BUILD}")
set(SUBMIT_RESULTS "${SUBMIT_RESULTS}")
set(RUN_TESTS "${RUN_TESTS}")

if(CLEAN_BUILD)
  ctest_empty_binary_directory(${CTEST_BINARY_DIRECTORY})
endif()

site_name(CTEST_SITE)
set(CTEST_BUILD_NAME "${BUILD_NAME}")

set(CTEST_CUSTOM_MAXIMUM_NUMBER_OF_WARNINGS 1000)
set(CTEST_CMAKE_GENERATOR "Ninja")
#set(CTEST_USE_LAUNCHERS 1)

set(CTEST_COVERAGE_COMMAND "${CTEST_COVERAGE_COMMAND}")
set(CTEST_MEMORYCHECK_COMMAND "${CTEST_MEMORYCHECK_COMMAND}")
set(CTEST_MEMORYCHECK_TYPE "${CTEST_MEMORYCHECK_TYPE}")




ctest_start("${BUILD_MODEL}")

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