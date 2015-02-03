FROM debian:wheezy

# From Dockerfile for docker-library/golang
#   https://github.com/docker-library/golang/blob/master/1.4/wheezy/Dockerfile

RUN apt-get update && apt-get install -y \
		gcc libc6-dev make curl git openssl ca-certificates mercurial pkg-config wget

RUN curl http://storage.googleapis.com/golang/go1.2.2.src.tar.gz | tar -v -C /usr/src -xz

RUN cd /usr/src/go/src && ./make.bash --no-clean 2>&1

ENV PATH /usr/src/go/bin:$PATH

RUN mkdir -p /go/src
ENV GOPATH /go
ENV PATH /go/bin:$PATH
WORKDIR /go


# Now, install the Chevaliers

ADD install_deps.sh /tmp/install_deps.sh
RUN /bin/bash /tmp/install_deps.sh

RUN go get github.com/tools/godep
RUN go get github.com/anchor/chevalier
RUN cd src/github.com/anchor/chevalier && make all

