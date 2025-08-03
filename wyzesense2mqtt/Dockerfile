ARG BUILD_FROM
FROM $BUILD_FROM

# Add S6 overlay
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=CONTINUE

# Copy your service files
COPY run.sh /etc/services.d/wyzesense2mqtt/run
RUN chmod +x /etc/services.d/wyzesense2mqtt/run

# Copy config files or binaries as needed
# COPY mybinary /usr/bin/

# Final ENTRYPOINT
ENTRYPOINT [ "/init" ]
