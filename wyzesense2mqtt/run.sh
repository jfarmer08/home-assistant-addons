#!/bin/sh
set -e

echo "Starting Wyzesense2MQTT run.sh"
echo "Reading addon options from /data/options.json:"
cat /data/options.json

# Helper: read option from /data/options.json
get_option() {
  jq -r --arg key "$1" '.[$key]' /data/options.json
}

# Read all options
MQTT_HOST=$(get_option mqtt_host)
MQTT_PORT=$(get_option mqtt_port)
MQTT_USERNAME=$(get_option mqtt_username)
MQTT_PASSWORD=$(get_option mqtt_password)
MQTT_CLIENT_ID=$(get_option mqtt_client_id)
MQTT_CLEAN_SESSION=$(get_option mqtt_clean_session)
MQTT_KEEPALIVE=$(get_option mqtt_keepalive)
MQTT_QOS=$(get_option mqtt_qos)
MQTT_RETAIN=$(get_option mqtt_retain)
SELF_TOPIC_ROOT=$(get_option self_topic_root)
HASS_TOPIC_ROOT=$(get_option hass_topic_root)
HASS_DISCOVERY=$(get_option hass_discovery)
PUBLISH_SENSOR_NAME=$(get_option publish_sensor_name)
USB_DONGLE=$(get_option usb_dongle)
SENSORS_CONFIG=$(get_option sensors_config)

# Write config.yaml for wyzesense2mqtt
mkdir -p /app/config/wyzesense2mqtt
cat <<EOF > /app/config/wyzesense2mqtt/config.yaml
mqtt_host: ${MQTT_HOST}
mqtt_port: ${MQTT_PORT}
mqtt_username: ${MQTT_USERNAME}
mqtt_password: ${MQTT_PASSWORD}
mqtt_client_id: ${MQTT_CLIENT_ID}
mqtt_clean_session: ${MQTT_CLEAN_SESSION}
mqtt_keepalive: ${MQTT_KEEPALIVE}
mqtt_qos: ${MQTT_QOS}
mqtt_retain: ${MQTT_RETAIN}
self_topic_root: ${SELF_TOPIC_ROOT}
hass_topic_root: ${HASS_TOPIC_ROOT}
hass_discovery: ${HASS_DISCOVERY}
publish_sensor_name: ${PUBLISH_SENSOR_NAME}
usb_dongle: ${USB_DONGLE}
EOF

# Write sensors_config to config/wyzesense2mqtt/sensors.yaml if provided
if [ -n "$SENSORS_CONFIG" ] && [ "$SENSORS_CONFIG" != "null" ]; then
  # Convert inline YAML list to dict using jq and yq
  # Supports extra attributes (e.g., humidity, temperature) in each sensor
  # Example input: [{mac: "77C2A194", name: "Front Door", type: "door"}, {mac: "77D53275", name: "Garage Climate", type: "climate", humidity: true, temperature: true}]
  echo "$SENSORS_CONFIG" | yq -o=json | jq 'map({(.mac): del(.mac)}) | add' | yq -P > /app/config/wyzesense2mqtt/sensors.yaml
fi

# Write default logging.yaml if missing
if [ ! -f /app/config/wyzesense2mqtt/logging.yaml ]; then
  cat <<EOL > /app/config/wyzesense2mqtt/logging.yaml
version: 1
formatters:
  simple:
    format: '%(message)s'
  verbose:
    datefmt: '%Y-%m-%d %H:%M:%S'
    format: '%(asctime)s %(levelname)-8s %(name)-15s %(message)s'
handlers:
  console:
    class: logging.StreamHandler
    formatter: simple
    level: DEBUG
  file:
    backupCount: 7
    class: logging.handlers.TimedRotatingFileHandler
    encoding: utf-8
    filename: logs/wyzesense2mqtt.log
    formatter: verbose
    level: INFO
    when: midnight
root:
  handlers:
    - file
    - console
  level: DEBUG
EOL
fi

# Debug: print config files before starting service
echo "==== /app/config/wyzesense2mqtt/config.yaml ===="
cat /app/config/wyzesense2mqtt/config.yaml
echo "==== /app/config/wyzesense2mqtt/sensors.yaml ===="
cat /app/config/wyzesense2mqtt/sensors.yaml 2>/dev/null || echo "(no sensors.yaml)"
echo "==== /app/config/wyzesense2mqtt/logging.yaml ===="
cat /app/config/wyzesense2mqtt/logging.yaml

cd /app

exec python3 /app/wyzesense2mqtt.py
