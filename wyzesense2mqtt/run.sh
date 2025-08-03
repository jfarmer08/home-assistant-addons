#!/usr/bin/env bash
set -e


# Write config.yaml for wyzesense2mqtt
cat <<EOF > /app/config/config.yaml
mqtt_host: "${mqtt_host}"
mqtt_port: ${mqtt_port}
mqtt_username: "${mqtt_username}"
mqtt_password: "${mqtt_password}"
mqtt_client_id: "${mqtt_client_id}"
mqtt_clean_session: ${mqtt_clean_session}
mqtt_keepalive: ${mqtt_keepalive}
mqtt_qos: ${mqtt_qos}
mqtt_retain: ${mqtt_retain}
self_topic_root: "${self_topic_root}"
hass_topic_root: "${hass_topic_root}"
hass_discovery: ${hass_discovery}
publish_sensor_name: ${publish_sensor_name}
usb_dongle: "${usb_dongle}"
EOF

# Write sensors_config to config/sensors.yaml if provided
if [ -n "$SENSORS_CONFIG" ]; then
  echo "$SENSORS_CONFIG" > /app/config/sensors.yaml
fi

exec python3 /app/wyzesense2mqtt.py
