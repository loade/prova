FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Europe/Rome

RUN apt-get update \
    && apt-get install --no-install-recommends -q -y gnupg2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys A4A9406876FCBD3C456770C88C718D3B5072E1F5

RUN echo "deb http://repo.mysql.com/apt/ubuntu/ bionic mysql-5.7" > /etc/apt/sources.list.d/mysql.list

RUN apt-get update && apt-get -q -y install --no-install-recommends \
    python3=3.8 \
    python3-pip \
    unzip \
    curl \
    mysql-community-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
   ./aws/install

CMD ["ls -l"] 
