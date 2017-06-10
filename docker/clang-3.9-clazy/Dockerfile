FROM purplekarrot/clang-3.9-clazy

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

RUN mkdir -p $BUILD_PATH
RUN mkdir -p $SOURCE_PATH
RUN mkdir -p $PREFIX_PATH

VOLUME $BUILD_PATH
VOLUME $SOURCE_PATH
VOLUME $PREFIX_PATH

WORKDIR $SOURCE_PATH

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]