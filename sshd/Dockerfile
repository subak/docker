FROM alpine:latest
MAINTAINER Subak Systems <info@subak.jp>

WORKDIR /root

RUN apk add --update openssh && \
    ssh-keygen -A && \
    sed -i -e 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

COPY sshd-entrypoint.sh /usr/local/bin/

EXPOSE 22
ENTRYPOINT ["sshd-entrypoint.sh"]
CMD ["-D"]
