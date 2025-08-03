#!/usr/bin/env bash
set -e

echo "Starting Wyzesense2MQTT addon..."

# Exec the original container command (replace shell with it)
exec wyzesense2mqtt
