#!/usr/bin/with-contenv bashio
set -e

# Export config options to environment variables
export MQTT_HOST=$(bashio::config 'mqtt_host')
export MQTT_PORT=$(bashio::config 'mqtt_port')
export MQTT_USERNAME=$(bashio::config 'mqtt_username')
export MQTT_PASSWORD=$(bashio::config 'mqtt_password')
export MQTT_CLIENT_ID=$(bashio::config 'mqtt_client_id')
export MQTT_CLEAN_SESSION=$(bashio::config 'mqtt_clean_session')
export MQTT_KEEPALIVE=$(bashio::config 'mqtt_keepalive')
export MQTT_QOS=$(bashio::config 'mqtt_qos')
export MQTT_RETAIN=$(bashio::config 'mqtt_retain')
export SELF_TOPIC_ROOT=$(bashio::config 'self_topic_root')
export HASS_TOPIC_ROOT=$(bashio::config 'hass_topic_root')
export HASS_DISCOVERY=$(bashio::config 'hass_discovery')
export PUBLISH_SENSOR_NAME=$(bashio::config 'publish_sensor_name')
export USB_DONGLE=$(bashio::config 'usb_dongle')

echo "[INFO] Starting WyzeSense2MQTT..."

# Activate virtual environment and run the Python app
exec /venv/bin/python /app/wyzesense2mqtt/__main__.py
