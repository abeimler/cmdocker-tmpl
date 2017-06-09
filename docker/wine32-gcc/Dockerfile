FROM purplekarrot/wine32-gcc

RUN apt-get -qq update \
	&& ./scripts/install-deps.sh \
 && rm -rf /var/lib/apt/lists/*