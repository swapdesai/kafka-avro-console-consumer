#!/bin/bash
set -e

if [ "$1" == "sh" ]; then
    $@
else
    kafka-avro-console-consumer \
        --bootstrap-server $BOOTSTRAP_SERVER \
        --topic $TOPIC_NAME \
        --property schema.registry.url=$SCHEMA_REGISTRY_URL \
        --consumer.config consumer.properties \
        --group $CONSUMER_GROUP \
        --max-messages 5 \
        --from-beginning | jq .
fi
