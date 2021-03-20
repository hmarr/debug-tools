FROM debian:stretch-slim

RUN echo "PS1='debug-\$(hostname | cut -c 1-6):\\w\\$ '" >> /root/.bashrc

RUN apt-get update && apt-get install -y \
  curl \
  dnsutils \
  htop \
  iproute2 \
  iputils-ping \
  jq \
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

RUN curl "https://api.github.com/repos/rbspy/rbspy/releases/latest" \
  | jq -r '.assets[] | select(.name | contains("linux")) | .browser_download_url' \
  | wget -i - -O - \
  | tar -C /usr/bin -xz rbspy
