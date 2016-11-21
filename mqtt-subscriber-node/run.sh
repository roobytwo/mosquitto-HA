#!/bin/bash

# give mosquitto time to configure
sleep 3

python /usr/src/app/subscribe_test.py

# stop container from quitting
sleep infinity