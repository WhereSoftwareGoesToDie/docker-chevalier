FROM debian:wheezy
MAINTAINER engineering@anchor.net.au

# Install  GoLang 1.2.2
# From Dockerfile for docker-library/golang
#   https://github.com/docker-library/golang/blob/master/1.4/wheezy/Dockerfile
#

RUN apt-get update && apt-get install -y \
	ca-certificates \
	curl \
	gcc \
	git \
	libc6-dev \
	make \
	mercurial \
	openssl \
	pkg-config \
	wget

RUN curl https://storage.googleapis.com/golang/go1.4.1.src.tar.gz | tar -v -C /usr/src -xz

RUN cd /usr/src/go/src && ./make.bash --no-clean 2>&1

ENV PATH /usr/src/go/bin:$PATH

RUN mkdir -p /go/src
ENV GOPATH /go
ENV PATH /go/bin:$PATH
WORKDIR /go

# ZeroMQ 3 (from source, because distro packages are old as.
#

RUN apt-get update && apt-get install -y \
	autoconf \
	automake \
	build-essential \
	libglib2.0-dev \
	libprotobuf-c0-dev \
	libtool \
	protobuf-c-compiler \
	protobuf-compiler

RUN mkdir -p deps

ADD zeromq-4.0.4.tar.gz /deps/
RUN cd /deps/zeromq-4.0.4 && \
	./configure && \
	make && make install  && \
	su -c "echo '/usr/local/lib' > /etc/ld.so.conf.d/local.conf" && \
	/sbin/ldconfig

RUN go get code.google.com/p/goprotobuf/proto
RUN go get code.google.com/p/goprotobuf/protoc-gen-go

# Finally, our knight in shining armor
#

RUN go get github.com/tools/godep
RUN go get github.com/anchor/chevalier
RUN cd src/github.com/anchor/chevalier && make all

EXPOSE 6283
EXPOSE 6284

# To invoke: 
#  docker run anchor/chevalier chevalier -d read -cfg /path/to/chevalier.gcfg
