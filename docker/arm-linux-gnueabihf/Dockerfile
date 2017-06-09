FROM purplekarrot/arm-linux-gnueabihf

RUN apt-get -qq update \
	&& ./scripts/install-deps.sh \
 && rm -rf /var/lib/apt/lists/*
