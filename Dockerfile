FROM ubuntu:trusty

RUN apt-get update && apt-get install -y docker.io && rm -rf /var/lib/apt/lists/*

COPY cron /
COPY backup /
RUN chmod +x /cron /backup
