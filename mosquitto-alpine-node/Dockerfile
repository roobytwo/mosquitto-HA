FROM alpine:3.4

MAINTAINER Matt Rabinovitch

ENV MOSQUITTO_HOME /etc/mosquitto/

# add mosquitto group and user
RUN addgroup -S mosquitto && \
    adduser -S -H -h /var/empty -s /sbin/nologin -D -G mosquitto mosquitto

#install base tools
RUN apk add --no-cache bash ca-certificates su-exec curl curl-dev libcurl libcap openssl wget \
    && wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 \
    && chmod +x /usr/local/bin/dumb-init \
    && apk del --purge deps; bash -c "rm -rf /{tmp,root}/{*,.??*}" \
    && rm -rf /var/cache/apk/*

# install mosquitto
RUN apk add --update mosquitto

# add config and run script
ADD /config/mosquitto.conf $MOSQUITTO_HOME/mosquitto.conf
ADD run.sh /run.sh
RUN chmod +x /run.sh

# make dir writable for mosquitto persistent storage
RUN mkdir /var/lib/mosquitto \
	&& chown mosquitto:mosquitto -R /var/lib/mosquitto

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/run.sh"]

