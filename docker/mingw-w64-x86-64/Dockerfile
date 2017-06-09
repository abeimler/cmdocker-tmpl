FROM purplekarrot/mingw-w64-x86-64

RUN apt-get -qq update \
	&& ./scripts/install-deps.sh \
 && rm -rf /var/lib/apt/lists/*