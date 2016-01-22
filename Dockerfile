FROM ubuntu:wily

WORKDIR /root

RUN apt-get update

# unison
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:eugenesan/ppa && \
    apt-get update && \
    apt-get install -y unison

ENV TZ Asia/Tokyo
ENV LANG C.UTF-8

EXPOSE 62483
ENTRYPOINT ["unison","-socket"]
CMD ["62483"]
