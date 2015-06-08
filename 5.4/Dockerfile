FROM php:5.4-apache
MAINTAINER info@subak.jp

RUN rm index.html

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y libjpeg62-turbo-dev libpng12-dev && rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd

RUN docker-php-ext-configure mbstring --enable-mbstring && \
    docker-php-ext-install mbstring

RUN docker-php-ext-configure mysql --with-mysql && \
    docker-php-ext-install mysql

RUN apt-get update && apt-get install -y ssmtp && rm -rf /var/lib/apt/lists/* && \
    echo 'sendmail_path = /usr/sbin/ssmtp -t' > /usr/local/etc/php/conf.d/ssmtp.ini

RUN curl -L -o seezoo.tgz https://bitbucket.org/seezoo/seezoo/get/default.tar.gz && \
    tar zxfv seezoo.tgz --wildcards -C . --strip=2 '*/src/*' && \
    rm seezoo.tgz

RUN mv htaccess.sample .htaccess && \
    mv files/data/mod_rewrite.txt files/data/.htaccess

RUN mv system/application/config_sample system/application/config

RUN chmod -R 777 files system/application/config system/logs && \
    chmod 666 system/application/config/config.php \
              system/application/config/database.php

RUN sed -i -e "s/'localhost'/getenv('MYSQL_PORT_3306_TCP_ADDR') ? getenv('MYSQL_PORT_3306_TCP_ADDR') : 'localhost'/" system/application/controllers/install.php

RUN mkdir conf && \
    mv system/application/config/config.php conf/config.php && \
    mv system/application/config/database.php conf/database.php && \
    ln -s /var/www/html/conf/config.php /var/www/html/system/application/config/config.php && \
    ln -s /var/www/html/conf/database.php /var/www/html/system/application/config/database.php

