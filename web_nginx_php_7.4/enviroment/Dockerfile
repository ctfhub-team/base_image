FROM php:7.4-fpm

LABEL Organization="CTFHub" Author="L1n3 <yw9381@163.com>"

ENV TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone &&\
    echo 'deb http://mirrors.tencent.com/debian bullseye main' > /etc/apt/sources.list &&\
    apt-get update -y &&\
    apt-get install -y net-tools curl wget nginx procps --no-install-recommends &&\
    apt-get clean all &&\
    rm -rf /var/lib/apt/lists/*

COPY files /tmp/

RUN mv /tmp/flag.sh /flag.sh &&\
    mv /tmp/start.sh /start.sh &&\
    chmod +x /flag.sh /start.sh &&\
    mv /tmp/nginx.conf /etc/nginx/nginx.conf &&\
    mv /tmp/docker-entrypoint.sh /usr/local/bin/docker-php-entrypoint &&\
    chmod +x /usr/local/bin/docker-php-entrypoint &&\
    chown -R www-data:www-data /var/www/html &&\
    mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini &&\
    echo '<?php phpinfo();' > /var/www/html/index.php &&\
    rm -rf /tmp/*

WORKDIR /var/www/html
EXPOSE 80