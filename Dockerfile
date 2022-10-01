FROM alpine:3.16

LABEL maintainer="team@appwrite.io"

RUN \
    apk update && \
    apk upgrade --available && \
    apk add --no-cache \
        bash=5.1.16-r2 \
        clamav-libunrar=0.104.3-r0 \
        clamav=0.104.3-r0 \
        rsyslog=8.2204.1-r0 \
        wget=1.21.3-r0 && \
    rm -rf /var/cache/apk/*

VOLUME ["/clamav"]

COPY conf /etc/clamav
COPY entrypoint.sh /start.sh
COPY health.sh /health.sh

RUN chmod +x /start.sh /health.sh

CMD ["/start.sh"]

HEALTHCHECK --start-period=350s CMD /health.sh

EXPOSE 3310/tcp
