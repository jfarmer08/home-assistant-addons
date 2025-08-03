ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest

FROM ${BUILD_FROM}

# Install needed packages
RUN apk add --no-cache python3 py3-pip git libusb tzdata

WORKDIR /app

# Clone wyzesense2mqtt repo
RUN git clone https://github.com/raetha/wyzesense2mqtt.git /app/wyzesense2mqtt

# Create and activate virtualenv
RUN python3 -m venv /venv

# Switch to the directory containing requirements.txt
WORKDIR /app/wyzesense2mqtt/wyzesense2mqtt

# Upgrade pip and install requirements inside venv
RUN /venv/bin/pip install --no-cache-dir --upgrade pip
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

# Copy your run script and give execution rights
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
