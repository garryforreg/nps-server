FROM golang:latest as builder

WORKDIR /

RUN apk add --no-cache git  build-base linux-headers && \
 	git clone -b zh_cn https://github.com/cnlh/nps.git  && \
 	cd nps && \
 	go build

FROM alpine:3.6
MAINTAINER garry <garryforreg@gmail.com>
WORKDIR /
ENV NPS_VERSION 0.17.3

RUN set -x && \
	COPY --from=builder /nps/ /nps/ && \	
	cd /nps && \
	mkdir \npsconf && \
	cp conf/* npsconf/ 

ADD start.sh /nps/npsconf/start.sh

RUN chmod +x /nps/npsconf/start.sh

VOLUME /nps/conf

CMD /nps/npsconf/start.sh
