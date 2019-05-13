FROM debian:stretch-slim

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
