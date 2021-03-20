FROM debian:stretch-slim

RUN echo "PS1='debug-\$(hostname | cut -c 1-6):\\w\\$ '" >> /root/.bashrc

RUN apt-get update && apt-get install -y \
  curl \
  dnsutils \
  htop \
  iputils-ping \
  lsof \
  ltrace \
  net-tools \
  netcat \
  nmap \
  openssl \
  procps \
  socat \
  strace \
  sysstat \
  wget
