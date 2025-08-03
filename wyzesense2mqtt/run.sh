#!/usr/bin/env bash
set -e

echo "Starting WyzeSense2MQTT with MQTT broker $MQTT_HOST:$MQTT_PORT"

# Build MQTT authentication options if username/password provided
mqtt_auth=""
if [ -n "$MQTT_USERNAME" ] && [ -n "$MQTT_PASSWORD" ]; then
  mqtt_auth="--mqtt-username $MQTT_USERNAME --mqtt-password $MQTT_PASSWORD"
fi

exec /wyzesense2mqtt \
  --mqtt-host "$MQTT_HOST" \
  --mqtt-port "$MQTT_PORT" \
  $mqtt_auth
