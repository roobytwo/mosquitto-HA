# Mosquitto HA

This project demonstrates how mosquitto brokers can be configured for high availability. Incoming messages and topics are replicated across broker nodes. This configuration does not scale horizontally, but provides redundancy.

## Getting Started

all applications in this project are run in docker containers, so simply clone the project, then run `docker-compose up`


## Cluster Structre
MQTT messages that are routed to any of the broker containers are forwarded to all other broker containers via one of the bridge nodes. The flow looks like this:

```python
MQTT-Publisher -> Mosquitto-Broker -> Mosquitto-Bridge -> Other-Mosquitto-Brokers
```
the cluster structure looks like this:

<img src="images/mosquitto-brokers-ha.png" width="400">

## Application Breakdown

this project has 3 notable containers:

* [Mosquitto Alpine (Bridge Node)](#mosquitto-alpine)
* [Mosquitto HA Broker](#mosquitto-ha-broker)
* [Mosquitto Publisher](#mosquitto-publisher)

##### Mosquitto Alpine (Bridge Node) <a id="mosquitto-alpine"></a>
This is an alpine based image with mosquitto installed and some minor changes to the mosquitto.conf file. The `docker-compose.yml` file specifies two of these containers. the `bridge` container is the primary bridge. All messages are routed through this container unless the container dies or becomes unavailable. If the `bridge` container becomes unavailble, the `hot-standby-bridge` container becomes the main connection for all mosquitto brokers.

##### Mosquitto HA Broker <a id="mosquitto-ha-broker"></a>
This image is based off of the Mosquitto Alpine image. It has added configuration that publishes any messages it receives from connected clients to the bridge container. It also subscribes to all topics on the bridge node, which means it gets all the messages from the other brokers in the cluster.

##### Mosquitto Publisher <a id="mosquitto-publisher"></a>
This is a simple MQTT publisher used for testing purposes. It publishes MQTT messages to the specified broker on the specified port. It has a delay interval which is necessary to give the mosquitto cluster time to stand up.

## Contributing

Fork and submit a pull request

## Authors

**Matt Rabinovitch**

## License

This project is licensed under the MIT License
