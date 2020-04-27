#!/bin/bash
set -e

if [ "$1" == "sh" ]; then
    $@
else
    echo $@
    echo kafka-avro-console-consumer \
        --bootstrap-server $BOOTSTAP_SERVER \
        --topic $TOPIC_NAME \
        --property schema.registry.url=$SCHEMA_REGISTRY_URL \
        --consumer.config ssl.properties \
        --group $CONSUMER_GROUP \
        --from-beginning
fi
