ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install dependencies
RUN apk add --no-cache python3 py3-pip git libusb

# Copy source and install it
WORKDIR /app
RUN git clone https://github.com/raetha/wyzesense2mqtt.git /app
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Start script
CMD [ "/run.sh" ]
