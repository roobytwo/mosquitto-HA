FROM local/atlas-mosquitto

# add run script
COPY run.sh /
RUN chmod +x /run.sh

ADD mosquitto.conf /etc/mosquitto/mosquitto.conf

ENTRYPOINT ["/run.sh"]
CMD ["mosquitto"]