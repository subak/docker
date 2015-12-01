FROM docker:1.8.3

RUN apk --update add bash apk-cron

COPY .docker /root/.docker/

COPY cron /
COPY backup /
COPY restore /
RUN chmod +x /cron /backup /restore
