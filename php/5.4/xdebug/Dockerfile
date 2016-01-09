FROM subak/php:5.4-base

RUN pecl install xdebug && \
    echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20100525/xdebug.so' > /usr/local/etc/php/conf.d/ext-xdebug.ini && \
    echo 'xdebug.remote_enable=true' >> /usr/local/etc/php/conf.d/ext-xdebug.ini && \
    echo 'xdebug.remote_connect_back=true' >> /usr/local/etc/php/conf.d/ext-xdebug.ini
