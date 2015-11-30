FROM alpine:latest

WORKDIR /root

RUN apk add --update openssh && \
    ssh-keygen -A && \
    sed -i -e 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN echo 'root:sshd' | chpasswd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
