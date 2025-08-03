ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

RUN apk add --no-cache python3 py3-pip git libusb

WORKDIR /app
RUN git clone https://github.com/raetha/wyzesense2mqtt.git /app

# Fix pip install using --break-system-packages
RUN pip3 install --no-cache-dir --break-system-packages -r requirements.txt

COPY run.sh /
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
