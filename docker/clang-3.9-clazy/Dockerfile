FROM purplekarrot/clang-3.9-clazy


RUN apt-get -qq update \
	&& ./scripts/install-deps.sh \
 && rm -rf /var/lib/apt/lists/*