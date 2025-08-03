#!/usr/bin/env bash
set -e


# Write config.yaml for wyzesense2mqtt
mkdir -p /app/config
cat <<EOF > /app/config/config.yaml
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

# Write sensors_config to config/sensors.yaml if provided
if [ -n "$SENSORS_CONFIG" ]; then
  echo "$SENSORS_CONFIG" > /app/config/sensors.yaml
fi

exec python3 /app/wyzesense2mqtt.py
