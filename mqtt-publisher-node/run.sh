#!/bin/bash

# give mosquitto time to configure
sleep $WAIT_TO_PUBLISH_TIME

python /usr/src/app/publish_test.py

# stop container from quitting
sleep infinity