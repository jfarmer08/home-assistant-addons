#!/usr/bin/env bash
set -e

echo "Starting Wyzesense2MQTT addon..."

# Start the WyzeSense2MQTT service using Python
exec python3 /wyzesense2mqtt/wyzesense2mqtt.py
