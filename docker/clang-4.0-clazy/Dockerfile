FROM purplekarrot/clang-4.0-clazy

#RUN apt-get install -qq -y --no-install-recommends binutils-dev
#RUN apt-get install -qq -y --no-install-recommends libboost-all-dev 

RUN apt-get -qq update && apt-get install -qq -y \
    libgtest-dev \
    libunittest++-dev \
    libicu-dev \
    libboost-serialization-dev \
    libssl-dev libboost-system-dev libboost-iostreams-dev \
    libboost-test-dev \
 && rm -rf /var/lib/apt/lists/*

## for cpp-coveralls
RUN apt-get -qq update && apt-get install -qq -y \
	python \
    python-pip \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --user cpp-coveralls



ENV BUILD_TYPE Release
ENV BUILD_PATH /binary/build
ENV SOURCE_PATH /source
ENV PREFIX_PATH /prefix
ENV CMAKE_OPTIONS ''

RUN mkdir -p $BUILD_PATH
RUN mkdir -p $SOURCE_PATH
RUN mkdir -p $PREFIX_PATH

COPY . $SOURCE_PATH

WORKDIR $SOURCE_PATH


## extra CMAKE_OPTIONS
RUN if [ -f "/toolchain.cmake" ]; then CMAKE_OPTIONS="$CMAKE_OPTIONS -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/toolchain.cmake"; fi
RUN CMAKE_OPTIONS="$CMAKE_OPTIONS -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX_PATH"

RUN ./scripts/prebuild.sh
RUN ./scripts/build.sh
RUN ./scripts/run-tests.sh

ENTRYPOINT ["/bin/bash"]