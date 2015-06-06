FROM php:5.4-apache
MAINTAINER info@subak.jp

RUN a2enmod rewrite && \
    a2enmod mime

RUN echo 'date.timezone = "Asia/Tokyo"' > /usr/local/etc/php/conf.d/date.ini

RUN apt-get update && apt-get install -y libjpeg62-turbo-dev libpng12-dev && rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd

RUN docker-php-ext-configure mbstring --enable-mbstring && \
    docker-php-ext-install mbstring

RUN docker-php-ext-configure mysql --with-mysql && \
    docker-php-ext-install mysql

RUN curl -o /usr/local/lib/php/extensions/no-debug-non-zts-20100525/ioncube.tgz http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
RUN tar zxfv /usr/local/lib/php/extensions/no-debug-non-zts-20100525/ioncube.tgz -C /usr/local/lib/php/extensions/no-debug-non-zts-20100525/ && \
    rm /usr/local/lib/php/extensions/no-debug-non-zts-20100525/ioncube.tgz
RUN echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20100525/ioncube/ioncube_loader_lin_5.4.so' > /usr/local/etc/php/conf.d/ext-ioncube.ini && \
    echo 'session.gc_probability = 0' >> /usr/local/etc/php/conf.d/ext-ioncube.ini

ENV ACMS_VERSION 2500

RUN curl -L -o ablogcms.tgz https://github.com/appleple/ablogcms-package/archive/php54x/ver$ACMS_VERSION.tar.gz

RUN tar zxfv ablogcms.tgz --wildcards -C . --strip=2 '*/ablogcms/*' && \
    rm ablogcms.tgz && \
    mv htaccess.txt .htaccess &&\
    chmod -R 777 config.server.php archives archives_rev media setup themes

RUN mv archives/htaccess.txt archives/.htaccess && \
    mv archives_rev/htaccess.txt archives_rev/.htaccess && \
    mv media/htaccess.txt media/.htaccess && \
    mv private/htaccess.txt private/.htaccess && \
    mv themes/htaccess.txt themes/.htaccess

COPY db_default.php /var/www/html/setup/lib/db_default.php

RUN sed -i -e "s/define('DB_HOST', ''/define('DB_HOST', getenv('MYSQL_PORT_3306_TCP_ADDR')/" config.server.php

RUN mkdir conf && \
    mv config.server.php conf && \
    ln -s conf/config.server.php config.server.php

RUN mv setup mente
