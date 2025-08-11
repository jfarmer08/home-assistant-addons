FROM jfarmer08/wyzesense2mqtt:devel
RUN apk add --no-cache jq yq
COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
