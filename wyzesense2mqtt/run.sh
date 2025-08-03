#!/usr/bin/env bash
set -e

# Run the wyzesense2mqtt app with passed environment variables
exec /wyzesense2mqtt \
  --mqtt-host "${MQTT_HOST}" \
  --mqtt-port "${MQTT_PORT}" \
  --mqtt-username "${MQTT_USERNAME}" \
  --mqtt-password "${MQTT_PASSWORD}" \
  --mqtt-client-id "${MQTT_CLIENT_ID}" \
  --mqtt-clean-session "${MQTT_CLEAN_SESSION}" \
  --mqtt-keepalive "${MQTT_KEEPALIVE}" \
  --mqtt-qos "${MQTT_QOS}" \
  --mqtt-retain "${MQTT_RETAIN}" \
  --self-topic-root "${SELF_TOPIC_ROOT}" \
  --hass-topic-root "${HASS_TOPIC_ROOT}" \
  --hass-discovery "${HASS_DISCOVERY}" \
  --publish-sensor-name "${PUBLISH_SENSOR_NAME}" \
  --usb-dongle "${USB_DONGLE}"
