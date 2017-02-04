FROM docker:1.12.1
MAINTAINER Subak Systems <info@subak.jp>

WORKDIR /root

# docker-compose
RUN apk add --update py-pip \
 && pip install docker-compose

# git
RUN apk add --update git-subtree \
 && git config --global color.ui auto

RUN apk add --update \
    bash \
    util-linux \
    screen \
    nano \
    mosh \
    less \
    curl \
    openssh \
    tzdata

# docker-machine
RUN curl -L https://github.com/docker/machine/releases/download/v0.8.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine \
 && chmod +x /usr/local/bin/docker-machine


# sakuracloud
RUN curl -L https://github.com/yamamoto-febc/docker-machine-sakuracloud/releases/download/v0.0.13/docker-machine-driver-sakuracloud-`uname -s`-`uname -m` >/usr/local/bin/docker-machine-driver-sakuracloud \
 && chmod +x /usr/local/bin/docker-machine-driver-sakuracloud


# begin build
RUN apk add --update build-base

# unison
ARG OCAML_VERSION=4.02.3
ARG UNISON_VERSION=2.48.3

# ocaml
RUN curl http://caml.inria.fr/pub/distrib/ocaml-$(echo ${OCAML_VERSION} | sed 's/\.[0-9]*$//')/ocaml-${OCAML_VERSION}.tar.gz \
  | tar zxv -C /tmp \
 && cd /tmp/ocaml-${OCAML_VERSION} \
 && ./configure -with-debug-runtime -no-graph \
 && make world.opt \
 && make install

# unison
RUN curl https://www.seas.upenn.edu/~bcpierce/unison/download/releases/unison-${UNISON_VERSION}/unison-${UNISON_VERSION}.tar.gz \
  | tar zxv -C /tmp \
 && cd /tmp/unison-${UNISON_VERSION} \
 && sed -i -e 's/GLIBC_SUPPORT_INOTIFY 0/GLIBC_SUPPORT_INOTIFY 1/' fsmonitor/linux/inotify_stubs.c \
 && make UISTYLE=text \
 && cp unison unison-fsmonitor /usr/local/bin \
 && rm -rfv /tmp/ocaml-${OCAML_VERSION} /tmp/unison-${UNISON_VERSION}


# stone
ADD http://www.gcd.org/sengoku/stone/stone-2.3e.tar.gz /tmp/stone.tar.gz
RUN apk add openssl-dev \
 && cd /tmp \
 && tar zxf stone.tar.gz \
 && cd /tmp/stone-*/ \
 && FLAGS=-D_GNU_SOURCE make linux-ssl \
 && cp -a stone /usr/local/bin \
 && rm -rfv /tmp/stone.tar.gz /tmp/stone-*


# end build
RUN apk del build-base


# env
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


# sshd
RUN ssh-keygen -A \
 && echo 'PermitUserEnvironment yes' >> /etc/ssh/sshd_config \
 && mkdir -p /root/.ssh \
 && chmod 700 /root/.ssh


EXPOSE 60000-60010/udp
EXPOSE 22

COPY client-entrypoint.sh /usr/local/bin/

ENTRYPOINT []
CMD ["client-entrypoint.sh","-D"]
