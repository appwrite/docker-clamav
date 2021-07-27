FROM alpine:3.14

LABEL maintainer="team@appwrite.io"

RUN \
    apk add --no-cache \
        bash \
        clamav-libunrar \
        clamav \
        rsyslog \
        wget && \
    rm -rf /var/cache/apk/*

VOLUME ["/clamav"]

COPY conf /etc/clamav
COPY entrypoint.sh /start.sh
COPY health.sh /health.sh

RUN chmod +x /start.sh /health.sh

CMD ["/start.sh"]

HEALTHCHECK --start-period=350s CMD /health.sh

EXPOSE 3310/tcp
