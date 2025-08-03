FROM ghcr.io/home-assistant/amd64-base:latest

RUN apk add --no-cache python3 py3-pip git libusb tzdata

WORKDIR /app

RUN git clone https://github.com/raetha/wyzesense2mqtt.git /app/wyzesense2mqtt

WORKDIR /app/wyzesense2mqtt    # <-- important: set working dir here where requirements.txt exists

RUN python3 -m venv /venv

RUN /venv/bin/pip install --no-cache-dir --upgrade pip
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
