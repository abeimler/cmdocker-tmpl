# use "modern" CMake with docker

[![Build Status](https://travis-ci.org/abeimler/cmdocker-tmpl.svg?branch=master)](https://travis-ci.org/abeimler/cmdocker-tmpl)

[![build status](https://gitlab.com/hircreacc/cmdocker-tmpl/badges/master/build.svg)](https://gitlab.com/hircreacc/cmdocker-tmpl/commits/master)


try to use some "best practices" in cmake. keep it simple.

 - default compiler settings (no -Wall, -std=c++11, ... no hardcoded compiler options)
 - use cmake properties and less if-else logic
 - avoid global variables
 - keep it simple, avoid functions/macros. use what cmake gives you
 - split CMakeLists.txt in sub_directories (src, test, benchmark)
 - split application in static libs (easier to build tests)
 - set `project(... VERSION)` from `VERSION`-file (or set it manually)


inspired by [Effective CMake by Daniel Pfeifer](https://github.com/boostcon/cppnow_presentations_2017/blob/master/05-19-2017_friday/effective_cmake__daniel_pfeifer__cppnow_05-19-2017.pdf) [(video)](https://youtu.be/bsXLMQ6WgIk)

thx at @purpleKarrot and @boostcon for [C++Now 2017](https://github.com/boostcon/cppnow_presentations_2017)


## Features

 * [x] use modern C++11/14
 * [x] use "modern" cmake 3.x
 * [x] sub directories (app components)
 * [x] use git subtree (not git submodule) for 3rd-party-libs
 * [x] use unit-tests
 * [x] use benchmarking
 * [x] build with docker (https://github.com/purpleKarrot/build-containers)
    * [x] use more compilers (and cross-compiling)
      - arm (gnueabihf)
      - clang (3.9, 4.0, 5.0)
      - gcc (5, 6, 7)
      - ~~mingw~~ (untested, overkill ?)
      - ~~msvc~~ (untested, overkill ?)
 * [x] use travis-ci with docker (travis-ci cpp is outdated)
 * [ ] use AppVeyor for Windows Builds
 * [ ] use gitlab-ci with docker
 * [x] run build with cmake
 * [ ] run CTest with CDash


## TODOs/NOTEs

 - (YOU) rename the Project "MyApp", search for `change project-name` and `change namespace`
 - [ ] try to avoid `file(GLOB)`, no "good" solution, yet ???
 - [ ] did 3rd-party header-only libs need `add_subdirectory` ???
 - [ ] did 3rd-party libs need EXCLUDE_FROM_ALL: `add_subdirectory(... EXCLUDE_FROM_ALL)` ???
 - [ ] what compiler-features use for default (`target_compile_features`) or set the C++ standard with ???
    - cxx_constexpr 
    - cxx_aggregate_default_initializers
    - cxx_auto_type 
    - cxx_range_for 
    - cxx_decltype_auto 
    - cxx_nullptr
    - cxx_lambdas



## Misc

### update/pull libs
 
 to update/pull libs from git run `./deps.sh`



### quick local build

 1. `mkdir -p ./build`
 2. `cd ./build`
 3. `cmake -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DDOCTEST_WITH_TESTS:BOOL="0" -DSKIP_PORTABILITY_TEST:BOOL="1" -DTHREAD_SAFE:BOOL="1" -DJUST_INSTALL_CEREAL:BOOL="1" -DBuilsTests:BOOL="0" ..`
 4. `cmake --build . --target all --config Release -- -j2`



### use clang-tidy (fix and format)

 1. `mkdir -p ./build`
 2. `cd ./build`
 3. `cmake -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DDOCTEST_WITH_TESTS:BOOL="0" -DSKIP_PORTABILITY_TEST:BOOL="1" -DTHREAD_SAFE:BOOL="1" -DJUST_INSTALL_CEREAL:BOOL="1" -DBuilsTests:BOOL="0" ..`
 4. ~~`cmake --build . --target all --config Release -- -j2`~~
 5. run clang-tidy: `python2 ../scripts/run-clang-tidy.py -p . -format -fix -header-filter=.*.h`