#!/usr/bin/with-contenv bashio

MQTT_HOST=$(bashio::config 'mqtt_host')
MQTT_PORT=$(bashio::config 'mqtt_port')
MQTT_USERNAME=$(bashio::config 'mqtt_username')
MQTT_PASSWORD=$(bashio::config 'mqtt_password')

bashio::log.info "Starting WyzeSense2MQTT add-on..."
bashio::log.info "Connecting to MQTT broker at ${MQTT_HOST}:${MQTT_PORT}"

if bashio::config.has_value 'mqtt_username'; then
    bashio::log.info "Using MQTT authentication"
else
    bashio::log.warning "MQTT authentication is not set"
fi

bashio::log.info "Launching raetha/wyzesense2mqtt container..."
docker run --rm   --device /dev/hidraw0   --net=host   -e MQTT_HOST="$MQTT_HOST"   -e MQTT_PORT="$MQTT_PORT"   -e MQTT_USERNAME="$MQTT_USERNAME"   -e MQTT_PASSWORD="$MQTT_PASSWORD"   raetha/wyzesense2mqtt:devel 2>&1 | tee /dev/stdout
