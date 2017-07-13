# use "modern" CMake with docker

[![Build Status](https://travis-ci.org/abeimler/cmdocker-tmpl.svg?branch=master)](https://travis-ci.org/abeimler/cmdocker-tmpl)

[![build status](https://gitlab.com/hircreacc/cmdocker-tmpl/badges/master/build.svg)](https://gitlab.com/hircreacc/cmdocker-tmpl/commits/master)


try to use some "best practices" in cmake.

 - default compiler settings (no -Wall, -std=c++11, ... no hardcoded compiler options)
 - use cmake properties and less if-else logic
 - avoid global variables
 - split CMakeLists.txt in sub_directories (src, test, benchmark)
 - split application in static libs (easier to build tests)


inspited by [Effective CMake by Daniel Pfeifer](https://github.com/boostcon/cppnow_presentations_2017/blob/master/05-19-2017_friday/effective_cmake__daniel_pfeifer__cppnow_05-19-2017.pdf) [(video)](https://youtu.be/bsXLMQ6WgIk)

thx at @purpleKarrot and @boostcon for [C++Now 2017](https://github.com/boostcon/cppnow_presentations_2017)


## Features

 * [x] use modern C++11/14
 * [x] use "modern" cmake 3.x
 * [x] sub directories (app components)
 * [x] git subtree (not git submodule) for 3rd-party-libs
 * [x] use unit-tests
 * [x] use benchmarking
 * [x] build with docker (https://github.com/purpleKarrot/build-containers)
 * [x] use more compilers (and cross-compiling)
        - arm (gnueabihf)
        - clang
        - gcc 
        - mingw
        - msvc
 * [x] use travis-ci with docker (travis-ci cpp is outdated)
 * [ ] use AppVeyor for Windows Builds
 * [ ] use gitlab-ci with docker
 * [x] run build with cmake
 * [ ] run CTest (and CDash?)


 ### update/pull libs
 
 to update/pull libs from git run `./deps.sh`


 ### use clang-tidy (fix and format)

  1. cmake configure: `cmake -B ./build -DBUILD_TESTING:BOOL="0" -DCMAKE_INSTALL_PREFIX:PATH="/usr/local" -DCMAKE_BUILD_TYPE:STRING="Release" -DSKIP_PORTABILITY_TEST:BOOL="1" -DJUST_INSTALL_CEREAL:BOOL="1" -DTHREAD_SAFE:BOOL="1" -DDOCTEST_WITH_TESTS:BOOL="0" -DBuildTests:BOOL="0"`
  2. ~~cmake build: `cmake --build ./build`~~
  3. run clang-tidy: `python2 ./scripts/run-clang-tidy.py -p ./build -format -fix -header-filter=.*.h`