FROM ubuntu:18.04

LABEL maintainer="team@appwrite.io"

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends --no-install-suggests clamav clamav-daemon clamav-freshclam wget net-tools && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN wget -O /var/lib/clamav/main.cvd http://database.clamav.net/main.cvd && \
  wget -O /var/lib/clamav/daily.cvd http://database.clamav.net/daily.cvd && \
  wget -O /var/lib/clamav/bytecode.cvd http://database.clamav.net/bytecode.cvd && \
  chown clamav:clamav /var/lib/clamav/*.cvd

RUN mkdir /var/run/clamav && \
    chown clamav:clamav /var/run/clamav && \
    chmod 750 /var/run/clamav

RUN sed -i 's/^Foreground .*$/Foreground true/g' /etc/clamav/clamd.conf && \
    echo "TCPSocket 3310" >> /etc/clamav/clamd.conf && \
    sed -i 's/^Foreground .*$/Foreground true/g' /etc/clamav/freshclam.conf

VOLUME ["/var/lib/clamav"]

EXPOSE 3310

ADD entrypoint.sh /
RUN chmod 775 /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
