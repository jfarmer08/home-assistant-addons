ARG BUILD_FROM=raetha/wyzesense2mqtt:devel
FROM ${BUILD_FROM}

# Don't override entrypoint or CMD unless necessary
# If you add a run.sh, make sure to exec the original CMD in it
COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT ["/run.sh"]
CMD []
