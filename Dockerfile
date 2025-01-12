FROM python:3-slim

RUN apt-get update && \
    apt-get install --no-install-recommends -y cron gettext-base chromium chromium-driver && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

RUN chmod +x entrypoint.sh

RUN pip install --no-cache-dir -r requirements.txt

# Expose a log file to monitor cron jobs
RUN touch /var/log/tracker-screenshots-cron.log

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
