# kafka-avro-console-consumer
Kakfa cli avro consumer built using 3 musketeers pattern (https://3musketeers.io/)
 
 
## Pre requisites
The ketstore `keystore.jks` and truststore `truststore.jks` file needs to present in this directory to mount inside the container
 
## Export the following env variables on your host machine to interact with kafka
```
export TRUSTSTORE_PASSWORD=<truststore-password>
export KEYSTORE_PASSWORD=<keystore-password>
 
export TOPIC_NAME=<topic-name>
 
export BOOTSTRAP_SERVER=<bootstrap-server>
 
export CONSUMER_GROUP=<consumer-group>
 
export SCHEMA_REGISTRY_URL=<schema-registry-url>
```
 
## Build the Docker container /app
```
make build
````
This step takes time to build the Docker image from Debain base image, install java and kafka tools and configure the cli.
 
 
## Run the Docker container /app
```
make run
```
