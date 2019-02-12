FROM rabbitmq:3
ENTRYPOINT ["/entrypoint.sh"]

ENV DUMP_DIRECTORY /dump
ENV DATA_DIRECTORY /data

COPY entrypoint.sh /entrypoint.sh
COPY do-backup.sh /do-backup.sh