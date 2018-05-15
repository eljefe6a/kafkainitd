#!/bin/bash

sudo service zookeeper status | cat
sudo service kafka-server status | cat
sudo service schema-registry status | cat
sudo service kafka-rest status | cat