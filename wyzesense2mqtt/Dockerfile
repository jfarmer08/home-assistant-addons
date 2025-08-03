ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

RUN apk add --no-cache python3 py3-pip git libusb

WORKDIR /app
RUN git clone https://github.com/raetha/wyzesense2mqtt.git .

WORKDIR /app/wyzesense2mqtt
RUN pip3 install --no-cache-dir --break-system-packages -r requirements.txt

COPY run.sh /run.sh
RUN chmod +x /run.sh

# IMPORTANT: do NOT set CMD here! Let s6-overlay run the container, and
# Home Assistant Supervisor will call /run.sh automatically.

# So no CMD or ENTRYPOINT lines in Dockerfile.
