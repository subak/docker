FROM debian:jessie
MAINTAINER Subak Systems <info@subak.jp>

RUN apt-get update && apt-get install -y --no-install-recommends samba
RUN rm -rf /var/lib/apt/lists/*

COPY password.txt /tmp/
RUN cat /tmp/password.txt /tmp/password.txt | smbpasswd -sa root
RUN rm /tmp/password.txt

RUN echo "include = /etc/samba/conf.d/smb.conf" >> /etc/samba/smb.conf && \
    mkdir /etc/samba/conf.d

COPY smb.conf /etc/samba/conf.d/

EXPOSE 137 138 139 445

CMD ["/usr/sbin/smbd", "-FS", "-s", "/etc/samba/smb.conf"]
