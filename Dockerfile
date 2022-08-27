FROM chrislusf/seaweedfs:3.23

EXPOSE 8888
EXPOSE 18888

WORKDIR /app

ADD app /app

RUN mv /app/hivemind-v1.1.0-linux-amd64 /usr/local/bin/hivemind

RUN chmod +x /usr/local/bin/hivemind
RUN chmod +x /app/start.sh
RUN chmod +x /app/sync.sh
RUN chmod +x /app/backup.sh
RUN chmod +x /app/seaweed.sh

ENTRYPOINT ["/app/start.sh"]