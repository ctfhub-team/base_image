FROM debian:12-slim

LABEL Organization="CTFHub" Author="L1n3 <yw9381@163.com>"

ENV TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone &&\
    echo 'deb http://mirrors.ustc.edu.cn/debian bookworm main' > /etc/apt/sources.list &&\
    rm -rf /etc/apt/sources.list.d/* &&\
    apt-get update -y &&\
    apt-get install -y net-tools curl wget nginx procps --no-install-recommends &&\
    apt-get clean all &&\
    rm -rf /var/lib/apt/lists/*

COPY files /tmp/

RUN mv /tmp/flag.sh /flag.sh &&\
    mv /tmp/start.sh /start.sh &&\
    chmod +x /flag.sh /start.sh &&\
    mv /tmp/docker-entrypoint.sh /docker-entrypoint.sh &&\
    chmod +x /docker-entrypoint.sh &&\
    rm -rf /var/www/html/* &&\
    echo "test page" > /var/www/html/index.html &&\
    chown -R www-data:www-data /var/www/html &&\
    rm -rf /tmp/*

WORKDIR /var/www/html
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 80