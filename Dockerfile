FROM alpine:3.8
MAINTAINER garry <garryforreg@gmail.com>

WORKDIR /
ENV NPS_VERSION 0.17.3

RUN set -x && \
	wget --no-check-certificate https://github.com/cnlh/nps/releases/download/V${NPS_VERSION}/linux_amd64_server.tar.gz && \ 
	tar xzf linux_amd64_server.tar.gz && \
	cd /nps && \
	rm -rf web && \
	mkdir \npsconf && \
	cp conf/* npsconf/ && \
	cd .. && \
	rm -rf *.tar.gz

COPY web /nps/
ADD start.sh /nps/npsconf/start.sh

RUN chmod +x /nps/npsconf/start.sh

VOLUME /nps/conf

CMD /nps/npsconf/start.sh
