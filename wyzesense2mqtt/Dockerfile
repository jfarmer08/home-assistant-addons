ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

# Install dependencies
RUN apk add --no-cache python3 py3-pip git libusb

# Clone just the relevant directory
WORKDIR /app
RUN git clone https://github.com/raetha/wyzesense2mqtt.git .

# Set working directory to where main code and requirements.txt exist
WORKDIR /app/wyzesense2mqtt

# Install Python requirements
RUN pip3 install --no-cache-dir --break-system-packages -r requirements.txt

# Copy run script (you can adjust this if your run.sh is different)
COPY run.sh /
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
