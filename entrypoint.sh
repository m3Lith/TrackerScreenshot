#!/bin/bash

echo "Starting tracker-screenshots cron job with schedule: ${CRON_SCHEDULE}"

# Replace the placeholder in the cron job template with the actual cron schedule
envsubst < /usr/src/app/cronjob > /etc/cron.d/tracker-screenshots

chmod 0644 /etc/cron.d/tracker-screenshots

crontab /etc/cron.d/tracker-screenshots

cron

echo "Started successfully."

# Tail the cron log to keep the container running and see output
tail -f /var/log/tracker-screenshots-cron.log
