#!/bin/bash

# Collect options from add-on config
MQTT_HOST=${MQTT_HOST:-$(bashio::config 'mqtt_host')}
MQTT_PORT=${MQTT_PORT:-$(bashio::config 'mqtt_port')}
MQTT_USERNAME=$(bashio::config 'mqtt_username')
MQTT_PASSWORD=$(bashio::config 'mqtt_password')

# Optional logging
echo "[INFO] Starting WyzeSense2MQTT with:"
echo "[INFO]   MQTT Host: $MQTT_HOST"
echo "[INFO]   MQTT Port: $MQTT_PORT"
echo "[INFO]   MQTT User: $MQTT_USERNAME"

exec /app/run.sh
