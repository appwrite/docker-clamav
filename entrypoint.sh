#!/bin/sh

set -e

# Check if /etc/clamav is empty
if [ -z "$(ls -A /etc/clamav)" ]; then
    echo "Extracting ClamAV configurations..."
    tar -xvjf /etc/_clamav.tar.bz2 /
    
    echo "Configuring ClamAV..."
    sed -i 's/^#\(Foreground\)/\1/; s/^#\(TCPSocket \)/\1/; s/^#\(CompressLocalDatabase \).*/\1yes/' /etc/clamav/freshclam.conf /etc/clamav/clamd.conf
fi

# Check for initial definitions
if [ ! -f /var/lib/clamav/main.cvd ]; then
    echo "Starting initial definition download..."
    /usr/bin/freshclam
fi

# Determine mode of operation
case $MODE in
    clamd)
        echo "Starting ClamAV daemon..."
        set -- /usr/sbin/clamd "$@"
        ;;
    freshclam)
        echo "Starting ClamAV update daemon..."
        set -- /usr/bin/freshclam -d -p "/run/clamav/freshclam.pid" "$@"
        ;;
    *)
        echo "Starting shell..."
        set -- /bin/sh
        ;;
esac

exec su-exec clamav "$@"
