ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM $BUILD_FROM

# Install dependencies required for WyzeSense2MQTT binary
RUN apk add --no-cache \
    libusb \
    libusb-dev \
    python3 \
    py3-pip \
    && pip3 install --upgrade pip

# Copy the WyzeSense2MQTT binary from the official image
# This assumes raetha/wyzesense2mqtt is based on alpine or linux and stores the binary at /wyzesense2mqtt
# We pull it in a multi-stage build

FROM raetha/wyzesense2mqtt:devel as builder

# Use multi-stage build to copy binary from the official image
FROM $BUILD_FROM
COPY --from=builder /wyzesense2mqtt /wyzesense2mqtt
RUN chmod +x /wyzesense2mqtt

# Copy your run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Define default config.json path
COPY config.json /data/options.json

CMD [ "/run.sh" ]
