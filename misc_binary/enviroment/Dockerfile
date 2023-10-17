FROM debian:12-slim

LABEL Organization="CTFHub" Author="L1n3 <yw9381@163.com>"

RUN echo 'deb http://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free' > /etc/apt/sources.list &&\
    rm /etc/apt/sources.list.d/* &&\
    apt update -y &&\
    apt install -y --no-install-recommends netbase procps &&\
    apt clean all &&\
    rm -rf /var/lib/apt/lists/*

COPY files /tmp
COPY src /tmp

RUN mv /tmp/flag.sh /flag.sh &&\
    mv /tmp/start.sh /start.sh &&\
    mv /tmp/docker-entrypoint.sh /docker-entrypoint.sh &&\
    chmod +x /flag.sh /start.sh /docker-entrypoint.sh &&\
    mkdir /app &&\
    mv /tmp/app /app/app &&\
    chmod +x /app/app &&\
    # /var/lib/apt/lists/* 
    rm -rf /tmp/* /var/tmp/*;

WORKDIR /app
EXPOSE 10000
EXPOSE 10800
CMD ["/docker-entrypoint.sh"]