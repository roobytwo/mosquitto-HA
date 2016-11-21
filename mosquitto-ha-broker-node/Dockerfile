FROM rubytwo/mosquitto-alpine:0.0.1

MAINTAINER Matt Rabinovitch

ENV MOSQUITTO_HOME /etc/mosquitto/

ADD /config/mosquitto.conf $MOSQUITTO_HOME/mosquitto.conf
ADD run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/run.sh"]

