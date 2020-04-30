# kafka-avro-console-consumer
## Introduction
Kakfa cli avro consumer built using 3 musketeers pattern (https://3musketeers.io/)
 
 
## Pre requisites
The keystore and truststore file needs to be created with appropriate **READ** permissions to Kafka topic.

 
### Export the following env variables on your host machine to interact with kafka
```
export KEYSTORE_FILE=<keystore-file>
export TRUSTSTORE_FILE=<truststore-file>

export KEYSTORE_PASSWORD=<keystore-password>
export TRUSTSTORE_PASSWORD=<truststore-password>
 
export TOPIC_NAME=<topic-name>
 
export BOOTSTRAP_SERVER=<bootstrap-server>
 
export CONSUMER_GROUP=<consumer-group>
 
export SCHEMA_REGISTRY_URL=<schema-registry-url>
```
 
## Make commands 
### Build the Docker container / app
```
make build
```
This step takes time to build the Docker image from Debain base image, install java and kafka tools and configure the cli.
 
### Export the consumer properties file
```
make vars
```
 
### Run the Docker container / app
```
make run
```
