#!/bin/bash

echo "Starting tracker-screenshots cron job with schedule: ${CRON_SCHEDULE}"

# Expose a log file to monitor cron jobs
touch /var/log/tracker-screenshots-cron.log

# Replace the placeholder in the cron job template with the actual cron schedule
envsubst < /usr/src/app/cronjob > /etc/cron.d/tracker-screenshots

chmod 0644 /etc/cron.d/tracker-screenshots

crontab /etc/cron.d/tracker-screenshots

cron

# Tail the cron log to keep the container running and see output
tail -f /var/log/tracker-screenshots-cron.log
