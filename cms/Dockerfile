FROM ubuntu:wily
MAINTAINER Subak Systems <info@subak.jp>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV TERM xterm-256color
WORKDIR /root

RUN apt-get update \
 && apt-get install -y software-properties-common

# pandoc
RUN apt-get install -y pandoc

# node
RUN apt-get install -y npm \
 && update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

# go
ENV GOPATH /root/.go
ENV PATH /root/.go/bin:$PATH
RUN apt-get install -y golang

# ruby
RUN apt-get install -y pry

# git
RUN apt-get install -y git

# php
RUN add-apt-repository -y ppa:ondrej/php-7.0 \
 && apt-get update && apt-get install -y php7.0-dev \
 && echo 'short_open_tag = On' > /etc/php/7.0/cli/conf.d/my-php.ini

# composer
ENV PATH /root/.composer/vendor/bin:$PATH
RUN curl -S https://getcomposer.org/installer | php \
 && mv composer.phar /usr/local/bin/composer

# ruby-jq
RUN cd /usr/src \
 && git clone https://github.com/stedolan/jq.git \
 && cd jq \
 && autoreconf -i \
 && ./configure --enable-shared \
 && make \
 && make install \
 && ldconfig \
 && gem install ruby-jq

# php-yaml
RUN apt-get install -y libyaml-dev \
 && echo '' | pecl install yaml-beta \
 && echo 'extension=yaml.so' > /etc/php/7.0/cli/conf.d/ext-yaml.ini

# psysh
RUN composer g require psy/psysh:@stable

# pup
RUN go get github.com/ericchiang/pup

# jq
RUN apt-get install -y jq

# yaml2json
RUN npm install -g yaml2json

# asciidoctor
RUN apt-get update && apt-get install -y default-jre graphviz fonts-vlgothic
RUN gem install asciidoctor \
 && gem install asciidoctor-diagram --pre \
 && gem install pygments.rb

# h2o
ENV H2O_VER 1.6.1
ENV H2O_URL https://github.com/h2o/h2o/archive/v${H2O_VER}.tar.gz
ENV H2O_DIR h2o-${H2O_VER}

RUN apt-get install -y \
    cmake \
    curl \
    libscope-guard-perl \
    libssl-dev \
    libtest-tcp-perl \
    libyaml-dev \
    liburi-perl \
    libio-socket-ssl-perl \
    ruby \
    bison

RUN curl -SL ${H2O_URL} | tar xzv
WORKDIR ${H2O_DIR}

RUN mkdir deps/mruby-uri \
 && curl -L https://github.com/zzak/mruby-uri/archive/master.tar.gz \
  | tar zxv --strip-components 1 -C deps/mruby-uri

RUN cmake -DWITH_BUNDLED_SSL=on . \
 && cmake -DWITH_MRUBY=ON . \
 && make install

WORKDIR /root

# sassc
WORKDIR /usr/src
ENV SASS_LIBSASS_PATH /usr/src/libsass
RUN git clone https://github.com/sass/libsass.git --depth 1 \
 && git clone https://github.com/sass/sassc.git --depth 1 \
 && cd sassc && make install
WORKDIR /root

EXPOSE 80

