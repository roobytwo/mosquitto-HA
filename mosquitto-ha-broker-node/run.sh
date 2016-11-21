#!/bin/bash

# lazy template building (me being lazy). Substitue all variables starting with MOSQUITTO or HOSTNAME
IFS=$'\n'
for VAR in `env`; do
  KEY="${VAR%=*}"
  VAL="${VAR#*=}"
  if [[ $KEY =~ ^MOSQUITTO_ ]] || [[ $KEY =~ ^HOSTNAME ]]; then
    sed --in-place "s~$KEY~$VAL~" $MOSQUITTO_HOME/mosquitto.conf
  fi
done

IFS=","
for broker in $MOSQUITTO_OTHER_BROKERS; do
	echo -e "\ntopic # in 2" '""' "$broker/" >> $MOSQUITTO_HOME/mosquitto.conf
done

exec mosquitto -c $MOSQUITTO_HOME/mosquitto.conf