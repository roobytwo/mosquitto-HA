import paho.mqtt.client as mqtt
import os

client = mqtt.Client()

BROKER_HOST = os.environ['BROKER_HOST']
BROKER_PORT = int(os.environ['BROKER_PORT'])

print ('attempting to connect with port: {} on host: {}'.format(BROKER_PORT, BROKER_HOST))
client.connect(BROKER_HOST, BROKER_PORT, 60)
print ('MQTT client started')
client.loop_start()

for i in range(0, 10):
    client.publish(('data'), 'dummy message: {}'.format(i), 1, True)
    
client.loop_stop()
client.disconnect()
print ('MQTT client finished') 
