FROM alpine:3

LABEL maintainer="team@appwrite.io"

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apk add --no-cache \
        bash \
        clamav-libunrar \
        clamav \
        rsyslog \
        wget

VOLUME ["/clamav"

EXPOSE 3310/tcp

COPY conf /etc/clamav
COPY entrypoint.sh /start.sh
COPY health.sh /health.sh

CMD ["/start.sh"]

HEALTHCHECK --start-period=350s CMD /health.sh