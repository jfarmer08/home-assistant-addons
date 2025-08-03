FROM raetha/wyzesense2mqtt:devel

ENV LANG C.UTF-8

# Optional: if you want to allow user configuration (env vars), add this entry script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
