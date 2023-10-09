FROM php:7.4-apache

LABEL Organization="CTFHub" Author="L1n3 <yw9381@163.com>"

ENV TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone &&\
    echo 'deb http://mirrors.tencent.com/debian bullseye main' > /etc/apt/sources.list &&\
    apt-get update -y &&\
    apt-get install -y net-tools curl wget --no-install-recommends &&\
    apt-get clean all &&\
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -y &&\
    apt-get install -y mariadb-server --no-install-recommends &&\
    apt-get clean all &&\
    rm -rf /var/lib/apt/lists/* &&\
    docker-php-source extract &&\
    docker-php-ext-install mysqli pdo_mysql &&\
    docker-php-source delete

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql &&\
    sh -c 'mysqld_safe &' &&\
    sleep 5s &&\
    mysqladmin -uroot password 'root' &&\
    mysql -uroot -proot -e "create user ping@'%' identified by 'ping';" &&\
    mysql -uroot -proot -e "create database web default character set utf8;" &&\
    mysql -uroot -proot -e "grant all privileges on web.* to 'web'@'localhost' identified by 'web';" &&\
    mysql -uroot -proot -e "grant all privileges on web.* to 'web'@'127.0.0.1' identified by 'web';"

COPY files /tmp/

RUN mv /tmp/flag.sh /flag.sh &&\
    mv /tmp/start.sh /start.sh &&\
    chmod +x /flag.sh /start.sh &&\
    mv /tmp/docker-entrypoint.sh /usr/local/bin/docker-php-entrypoint &&\
    chmod +x /usr/local/bin/docker-php-entrypoint &&\
    chown -R www-data:www-data /var/www/html &&\
    mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini &&\
    echo '<?php phpinfo();' > /var/www/html/index.php &&\
    rm -rf /tmp/*

WORKDIR /var/www/html
EXPOSE 80