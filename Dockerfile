FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Europe/Rome

RUN apt-get update \
    && apt-get install --no-install-recommends -q -y gnupg2=2.2.19-3ubuntu2.1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get -q -y install --no-install-recommends \
    python3=3.8.2-0ubuntu2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


CMD ["ls -l"] 
