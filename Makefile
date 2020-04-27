# file: Makefile
DOCKER_BUILD_KAFKA_AVRO_CONSOLE_CONSUMER=docker-compose build
DOCKER_RUN_KAFKA_AVRO_CONSOLE_CONSUMER=\
	docker run -it \
	--mount type=bind,source=${PWD}/consumer.properties,target=/consumer.properties,readonly \
	-e SCHEMA_REGISTRY_OPTS="-Djavax.net.ssl.trustStore=/truststore -Djavax.net.ssl.trustStorePassword=${TRUSTSTORE_PASSWORD} -Djavax.net.ssl.keyStore=/keystore -Djavax.net.ssl.keyStorePassword=${KEYSTORE_PASSWORD}" \
	-e BOOTSTAP_SERVER=${BOOTSTAP_SERVER} \
	-e TOPIC_NAME=${TOPIC_NAME} \
	-e SCHEMA_REGISTRY_URL=${SCHEMA_REGISTRY_URL} \
	-e CONSUMER_GROUP=${CONSUMER_GROUP} \
	kafka-avro-console-consumer

# CONSUMER_PROPERTIES is consumer.properties.template by default but can be overwritten
CONSUMER_PROPERTIES ?= consumer.properties.template


###############
## Variables ##
###############
vars: consumerProperties
.PHONY: vars


###########
## Build ##
###########
build: _build
.PHONY: build

###########
## Build ##
###########
run: _run
.PHONY: run



consumerProperties:
	echo "security.protocol = SSL" > consumer.properties.template

	echo "ssl.truststore.location = truststore.jks" >> consumer.properties.template
	echo "ssl.truststore.password = $(TRUSTSTORE_PASSWORD)" >> consumer.properties.template

	echo "ssl.keystore.location = keystore.jks" >> consumer.properties.template
	echo "ssl.keystore.password = $(KEYSTORESTORE_PASSWORD)" >> consumer.properties.template

	cp -f $(CONSUMER_PROPERTIES) consumer.properties
.PHONY: consumerProperties


_build:
	$(DOCKER_BUILD_KAFKA_AVRO_CONSOLE_CONSUMER)
.PHONY: _build

_run:
	$(DOCKER_RUN_KAFKA_AVRO_CONSOLE_CONSUMER)
.PHONY: _run

_clean:
	docker-compose down --remove-orphans
.PHONY: _clean
