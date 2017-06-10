FROM purplekarrot/gcc-5

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


RUN mkdir /binary
RUN mkdir /source
RUN mkdir /prefix

VOLUME /source
VOLUME /binary
VOLUME /prefix

WORKDIR /source

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]