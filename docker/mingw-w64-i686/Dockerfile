FROM purplekarrot/mingw-w64-i686

RUN apt-get -qq update \
	&& ./scripts/install-deps.sh \
 && rm -rf /var/lib/apt/lists/*