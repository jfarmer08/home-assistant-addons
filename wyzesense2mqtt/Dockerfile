ARG BUILD_FROM=raetha/wyzesense2mqtt:devel
FROM $BUILD_FROM

# Copy run.sh script into container
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
