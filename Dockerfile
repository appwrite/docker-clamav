FROM alpine:3.20

LABEL maintainer="team@appwrite.io"

RUN apk add --no-cache \
        clamav \
        su-exec && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /run/clamav && \
    chown -R clamav:clamav /run/clamav && \
    sed -i 's/^#\(Foreground\)/\1/' /etc/clamav/freshclam.conf && \
    sed -i 's/^#\(Foreground \).*/\1yes/' /etc/clamav/clamd.conf && \
    sed -i 's/^#\(TCPSocket \)/\1/' /etc/clamav/clamd.conf && \
    sed -i 's/^#\(CompressLocalDatabase \).*/\1yes/' /etc/clamav/freshclam.conf && \
    tar -cvjf /etc/_clamav.tar.bz2 /etc/clamav

COPY entrypoint.sh /start.sh
COPY health.sh /health.sh

RUN chmod +x /start.sh /health.sh

ENTRYPOINT ["/start.sh"]

VOLUME /etc/clamav
VOLUME /var/lib/clamav

HEALTHCHECK --start-period=350s CMD /health.sh

EXPOSE 3310/tcp