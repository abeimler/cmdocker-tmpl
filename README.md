# use "modern" CMake with docker

try to make some "best practices"

inspited by [Effective CMake by Daniel Pfeifer](https://github.com/boostcon/cppnow_presentations_2017/blob/master/05-19-2017_friday/effective_cmake__daniel_pfeifer__cppnow_05-19-2017.pdf) [(video)](https://youtu.be/bsXLMQ6WgIk)

thx at @purpleKarrot and @boostcon for [C++Now 2017](https://github.com/boostcon/cppnow_presentations_2017)


## Features

 * [x] use modern C++14
 * [x] use "modern" cmake
 * [x] sub directories (app components)
 * [x] git subtree (not git submodule) for (git) libs
 * [x] use unit-tests
 * [x] use benchmarking
 * [ ] build with docker (https://github.com/purpleKarrot/build-containers)
 * [ ] use travis-ci with docker (travis-ci cpp is outdated)
 * [ ] use gitlab-ci with docker


 ### update/pull libs
 to update/pull libs from git run `./deps.sh`