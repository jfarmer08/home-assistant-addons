ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

# Install dependencies for Python and USB
RUN apk add --no-cache python3 py3-pip git libusb tzdata

# Copy the whole wyzesense2mqtt folder from repo into /app
COPY wyzesense2mqtt /app/

# Upgrade pip and install python requirements
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir -r /app/requirements.txt

# Copy your run.sh script that the supervisor will call
COPY run.sh /run.sh
RUN chmod +x /run.sh

# DO NOT override ENTRYPOINT or CMD here — let s6-overlay handle it
