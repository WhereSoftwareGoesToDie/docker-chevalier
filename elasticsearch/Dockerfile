FROM debian:wheezy
MAINTAINER engineering@anchor.net.au

# Elastic search
# Originally from https://github.com/dockerfile/elasticsearch/blob/master/Dockerfile
# Wheezy + Java8 - http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html
#

RUN apt-get update && apt-get install -y build-essential openssl ca-certificates 

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

# Auto accept - required for unattended installation
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | \
        /usr/bin/debconf-set-selections

RUN apt-get update && apt-get install oracle-java8-installer -y

ENV ES_PKG_NAME elasticsearch-1.4.2

RUN \
  cd / && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch


VOLUME ["/data"]

WORKDIR /data

CMD ["/elasticsearch/bin/elasticsearch"]

EXPOSE 9200
EXPOSE 9300
