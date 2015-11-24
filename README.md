# Kafka `init.d`

`init.d` scripts for Kafka. Will work out of the box with Confluent Data Platform or mainline Kafka.

## Using the Scripts

1. Clone this repository.
2. Go to the cloned repository 
  `cd kafkainitd`
2. Give the scripts execute permissions:
  ```
  sudo chmod 0755 zookeeper
  sudo chmod 0755 kafka-server
  sudo chmod 0755 schema-registry
  sudo chmod 0755 kafka-rest
  ```

2. Copy the scripts to init.d:
  ```
  sudo cp zookeeper /etc/init.d
  sudo cp kafka-server /etc/init.d
  sudo cp schema-registry /etc/init.d
  sudo cp kafka-rest /etc/init.d
  ```

2. Set them to run at boot:
  ```
  sudo update-rc.d zookeeper defaults
  sudo update-rc.d kafka-server defaults
  sudo update-rc.d schema-registry defaults
  sudo update-rc.d kafka-rest defaults 91
  ```

**Note:** If you're just using Kafka, don't run the commands for `schema-registry` or `kafka-rest` and possibly `zookeeper`.
