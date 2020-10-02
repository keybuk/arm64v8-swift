FROM arm64v8/ubuntu:bionic
ENV SWIFT_IMAGE_URL=https://github.com/futurejones/swift-arm64/releases/download/v5.3-RELEASE/swiftlang-5.3-ubuntu-18.04-release-aarch64-1-2020-09-17.tar.gz

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
	apt-get -q update && \
	apt-get install -y \
	build-essential \
	libatomic1 \
	libcurl4 \
	libxml2 \
	libedit2 \
	libsqlite3-0 \
	zlib1g-dev \
	libpython2.7 \
	libtinfo5 \
	libncurses5 \
	curl \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -SL $SWIFT_IMAGE_URL \
	| tar -xzC /
RUN echo /usr/lib/swift/linux > /etc/ld.so.conf.d/swift.conf \
	&& ldconfig
RUN swift --version
