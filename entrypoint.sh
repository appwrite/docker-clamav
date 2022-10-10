#!/bin/sh

set -e

if [ ! "$(ls -A /etc/clamav)" ]; then
    tar -xvjf /etc/_clamav.tar.bz2 /

    sed -i 's/^#\(TCPSocket \)/\1/' /etc/clamav/clamd.conf
    sed -i 's/^#\(Foreground \).*/\1yes/' /etc/clamav/clamd.conf
    sed -i 's/^#\(Foreground \).*/\1yes/' /etc/clamav/freshclam.conf
    sed -i 's/^#\(CompressLocalDatabase \).*/\1yes/' /etc/clamav/freshclam.conf
fi

if [ ! -f /var/lib/clamav/main.cvd ]; then
    echo "Starting initial definition download"
    /usr/bin/freshclam
fi

if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
    case $MODE in
        clamd)
            echo "Starting clamav daemon"
            set -- /usr/sbin/clamd $@
            ;;
        freshclam)
            echo "Starting the update daemon"
            set -- /usr/bin/freshclam -d -p "/run/clamav/freshclam.pid" $@
            ;;
        *)
            set -- /bin/sh
            ;;
    esac
fi

exec su-exec clamav "$@"
