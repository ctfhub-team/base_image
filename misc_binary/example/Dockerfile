FROM ctfhub_base/misc_binary

COPY src/ /app/
COPY files/start.sh /start.sh
RUN chmod +x /app/*
RUN apt update &&\
    apt install socat -y &&\
    apt clean all &&\
    rm -rf /var/lib/apt/lists/*
