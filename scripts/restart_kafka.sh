#!/bin/bash

function restartAndCheck {
  serviceName=$1
  sleepTime=$2
  correctRunningStatus=$3
  logFile=$4

  sudo service $serviceName restart

  sleep $sleepTime

  if [[ $(sudo service $serviceName status) != $correctRunningStatus ]]; then
    echo "****$serviceName not running. Outputting log:****"
    tail -n 40 $logFile
  fi
}

restartAndCheck "zookeeper" "5s" "ZooKeeper running" "/var/log/kafka/zookeeper.out"

restartAndCheck "kafka-server" "5s" "Kafka Broker running" "/var/log/kafka/kafka-server.out"

# Do a long pause to let Kafka server start
restartAndCheck "schema-registry" "10s" "Schema Registry running" "/var/log/kafka/schema-registry.out"

restartAndCheck "kafka-rest" "1s" "Kafka REST running" "/var/log/kafka/kafka-rest.out"
