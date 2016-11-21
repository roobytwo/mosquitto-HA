import paho.mqtt.client as mqtt
import os

BROKER_HOST = os.environ['MOSQUITTO_ALIAS']
BROKER_PORT = int(os.environ['MOSQUITTO_PORT'])

# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
    print('attempting to connect with port: {} on host: {}'.format(ATLAS_PORT, ATLAS_HOST))
    client.subscribe('data')

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
    print(msg.payload)

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.username_pw_set('guest', password='guest')

print('attempting to connect')
client.connect(ATLAS_HOST, ATLAS_PORT, 60)

print('MQTT client started')
client.loop_forever(timeout=20)