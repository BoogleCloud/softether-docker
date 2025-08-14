FROM ubuntu:24.04

RUN apt-get update && apt-get -y install curl make gcc openssl unzip goxkcdpwgen && apt clean

RUN curl -L -o /tmp/softether.tar.gz https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.44-9807-rtm/softether-vpnserver-v4.44-9807-rtm-2025.04.16-linux-x64-64bit.tar.gz \
    && mkdir -p /opt/softether \
    && tar -xzf /tmp/softether.tar.gz -C /opt/softether \
    && rm /tmp/softether.tar.gz

WORKDIR /opt/softether/vpnserver
RUN make

COPY launch /
CMD ["/bin/sh", "-c", "/launch"]