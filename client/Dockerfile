FROM subak/docker
MAINTAINER Subak Systems <info@subak.jp>

RUN apk update

# ssh
RUN apk add openssh && \
    ssh-keygen -A

WORKDIR /root
RUN mkdir .ssh \
 && chmod 700 .ssh \
 && touch .ssh/config

# git
WORKDIR /root
RUN apk add git-subtree \
 && git config --global color.ui auto \
 && echo "Host github.com\n\tStrictHostKeyChecking no\n" >> .ssh/config \
 && echo "Host bitbucket.org\n\tStrictHostKeyChecking no\n" >> .ssh/config

RUN apk add \
    util-linux \
    screen \
    nano \
    mosh \
    less

# stone
ADD http://www.gcd.org/sengoku/stone/stone-2.3e.tar.gz /tmp/stone.tar.gz
RUN apk add gcc make libc-dev openssl-dev \
 && cd /tmp \
 && tar zxf stone.tar.gz \
 && cd /tmp/stone-*/ \
 && FLAGS=-D_GNU_SOURCE make linux-ssl \
 && cp -a stone /usr/local/bin

RUN sed -i 's/\/bin\/ash/\/bin\/bash/' /etc/passwd

ENV SHELL /bin/bash
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV TERM xterm-256color
ENV PS1 '\h:\W\$ '
WORKDIR /root
RUN echo '. ${HOME}/.bashrc' > .bash_profile \
 && echo 'export LANG=C.UTF-8' >> .bashrc \
 && echo 'export TZ=Asia/Tokyo' >> .bashrc \
 && echo 'export TERM=xterm-256color' >> .bashrc \
 && echo "export PS1='"'\h:\W\$ '"'" >> .bashrc \
 && echo '. ${HOME}/.profile' >> .bashrc \
 && touch .profile

EXPOSE 60000-61000/udp
EXPOSE 22

COPY client-entrypoint.sh /usr/local/bin/

ENTRYPOINT []
CMD ["client-entrypoint.sh","-D"]
