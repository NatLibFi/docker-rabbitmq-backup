#!/bin/sh
set -e 

DUMP_FILE=${DUMP_DIRECTORY}/${BACKUP_PREFIX}-`date +%d%m%yT%H%M.tar.gz`

echo "Dumping database to ${DUMP_FILE}..."

rabbitmqctl --erlang-cookie $RABBITMQ_ERLANG_COOKIE -n rabbit@$MQ_HOST stop_app
tar -C $DATA_DIRECTORY -czf $DUMP_FILE .
rabbitmqctl --erlang-cookie $RABBITMQ_ERLANG_COOKIE -n rabbit@$MQ_HOST start_app

echo "Done."
