FROM python:3-slim

LABEL org.opencontainers.image.source=https://github.com/m3Lith/TrackerScreenshot
LABEL org.opencontainers.image.description=""
LABEL org.opencontainers.image.licenses=GPLv3

RUN apt-get update && \
    apt-get install --no-install-recommends -y cron gettext-base chromium chromium-driver && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

RUN chmod +x entrypoint.sh

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
