#!/usr/bin/env bash
set -e

# Export environment variables from Home Assistant options
export MQTT_HOST="${MQTT_HOST:-$mqtt_host}"
export MQTT_PORT="${MQTT_PORT:-$mqtt_port}"
export MQTT_USERNAME="${MQTT_USERNAME:-$mqtt_username}"
export MQTT_PASSWORD="${MQTT_PASSWORD:-$mqtt_password}"
export MQTT_CLIENT_ID="${MQTT_CLIENT_ID:-$mqtt_client_id}"
export MQTT_CLEAN_SESSION="${MQTT_CLEAN_SESSION:-$mqtt_clean_session}"
export MQTT_KEEPALIVE="${MQTT_KEEPALIVE:-$mqtt_keepalive}"
export MQTT_QOS="${MQTT_QOS:-$mqtt_qos}"
export MQTT_RETAIN="${MQTT_RETAIN:-$mqtt_retain}"
export SELF_TOPIC_ROOT="${SELF_TOPIC_ROOT:-$self_topic_root}"
export HASS_TOPIC_ROOT="${HASS_TOPIC_ROOT:-$hass_topic_root}"
export HASS_DISCOVERY="${HASS_DISCOVERY:-$hass_discovery}"
export PUBLISH_SENSOR_NAME="${PUBLISH_SENSOR_NAME:-$publish_sensor_name}"
export USB_DONGLE="${USB_DONGLE:-$usb_dongle}"

# Start the main process

# Write sensors_config to config/sensors.yaml if provided
if [ -n "$SENSORS_CONFIG" ]; then
  echo "$SENSORS_CONFIG" > /app/config/sensors.yaml
fi

exec python3 /app/wyzesense2mqtt.py
echo "Starting Wyzesense2MQTT addon..."
