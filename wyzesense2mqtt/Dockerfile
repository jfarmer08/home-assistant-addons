# Use Home Assistant base image
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM $BUILD_FROM

# Install bash (if needed)
RUN apk add --no-cache bash

# Copy the run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Copy any other files you need here if necessary

# Run the run.sh script on container start
CMD [ "/run.sh" ]
