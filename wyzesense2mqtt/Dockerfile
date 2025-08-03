ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

RUN apk add --no-cache python3 py3-pip git libusb tzdata

WORKDIR /app

# Clone the repo into /app/wyzesense2mqtt
RUN git clone https://github.com/raetha/wyzesense2mqtt.git /app/wyzesense2mqtt

WORKDIR /app/wyzesense2mqtt

# Create and activate virtual environment, then install requirements inside it
RUN python3 -m venv /venv

# Install packages inside the virtualenv
RUN /venv/bin/pip install --no-cache-dir --upgrade pip
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

# Copy your run.sh that will activate virtualenv and run the app
COPY run.sh /run.sh
RUN chmod +x /run.sh
