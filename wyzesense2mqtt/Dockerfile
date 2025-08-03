ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

# Install dependencies
RUN apk add --no-cache python3 py3-pip git libusb

# Clone the repo
RUN git clone https://github.com/raetha/wyzesense2mqtt.git /app

# Change into the app directory
WORKDIR /app

# Install Python requirements with workaround for Alpine's restrictions
RUN pip3 install --no-cache-dir --break-system-packages -r requirements.txt

# Copy and set executable permissions on the run script
COPY run.sh /
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
