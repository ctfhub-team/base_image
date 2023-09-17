FROM debian:12-slim

LABEL Organization="CTFHub" Author="L1n3 <yw9381@163.com>"

RUN echo 'deb http://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free' > /etc/apt/sources.list &&\
    rm /etc/apt/sources.list.d/* &&\
    apt update -y &&\
    apt install -y --no-install-recommends netbase telnet xinetd procps &&\
    apt install -y --no-install-recommends lib32ncurses6 lib32z1 lib32stdc++6 &&\
    apt clean all &&\
    rm -rf /var/lib/apt/lists/*

COPY files /tmp
COPY src /tmp

RUN mv /tmp/xinetd.conf /etc/xinetd.conf &&\
    mv /tmp/pwn.xinetd.conf /etc/xinetd.d/pwn &&\
    mv /tmp/banner_fail /etc/banner_fail &&\
    mv /tmp/flag.sh /flag.sh &&\
    mv /tmp/start.sh /start.sh &&\
    mv /tmp/pwn /pwn &&\
    chmod +x /start.sh &&\
    # pwn home dir
    useradd -U -m pwn &&\
    # pwn home dir permission
    chown -R root:pwn /pwn &&\
    chmod -R 750 /pwn &&\
    # /var/lib/apt/lists/* 
    rm -rf /tmp/* /var/tmp/*;

WORKDIR /
EXPOSE 10000
CMD ["/start.sh"]