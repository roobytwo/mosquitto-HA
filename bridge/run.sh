#!/bin/bash
set -e

# lazy template building. Substitue all variables starting with KAFKA or ZOOKEEPER
# for VAR in `env`; do
#   KEY="${VAR%=*}" # see: https://goo.gl/Nmr6tl
#   VAL="${VAR#*=}"
#   if [[ $KEY =~ ^AUTH_SERVICE_ ]]; then
#     sed --in-place "s~$KEY~$VAL~" /etc/mosquitto.d/auth-plugin.conf
#   fi
# done

chown mosquitto:mosquitto -R /var/lib/mosquitto

if [ "$1" = 'mosquitto' ]; then
	exec /usr/local/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
fi

exec "$@"

