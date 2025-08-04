FROM raetha/wyzesense2mqtt:devel
RUN apk add --no-cache jq
COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
