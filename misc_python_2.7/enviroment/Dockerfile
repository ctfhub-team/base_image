FROM python:2.7.18-slim-buster

LABEL Organization="CTFHub" Author="L1n3 <yw9381@163.com>"

RUN echo 'deb http://mirrors.ustc.edu.cn/debian/ buster main contrib non-free' > /etc/apt/sources.list &&\
    rm -rf /etc/apt/sources.list.d/* &&\
    apt update -y &&\
    apt install -y --no-install-recommends netbase telnet xinetd procps python-pip &&\
    pip config set global.index-url https://pypi.douban.com/simple &&\
    apt clean all &&\
    rm -rf /var/lib/apt/lists/*

COPY files /tmp
COPY src /tmp

RUN mv /tmp/xinetd.conf /etc/xinetd.conf &&\
    mv /tmp/app.xinetd.conf /etc/xinetd.d/app &&\
    mv /tmp/banner_fail /etc/banner_fail &&\
    mv /tmp/flag.sh /flag.sh &&\
    mv /tmp/start.sh /start.sh &&\
    mv /tmp/entrypoint.sh /entrypoint.sh &&\
    chmod +x /*.sh &&\
    # app
    mkdir -p /app &&\
    mv /tmp/app.py /app/app.py &&\
    useradd -U -m app &&\
    # app home dir permission
    chown app:app /app -R &&\
    # clean
    rm -rf /tmp/* /var/tmp/*;

WORKDIR /app
EXPOSE 10000
CMD ["/entrypoint.sh"]
