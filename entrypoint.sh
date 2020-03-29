#!/bin/bash
# bootstrap clam av service and clam av database updater shell script
# presented by mko (Markus Kosmal<dude@m-ko.de>)
set -m

# configure freshclam.conf and clamd.conf from env variables if present
for OUTPUT in $(env | awk -F "=" '{print $1}' | grep "^CLAMD_CONF_")
do
	TRIMMED=$(echo $OUTPUT | sed 's/CLAMD_CONF_//g')
	grep -q "^$TRIMMED " /etc/clamav/clamd.conf && sed "s/^$TRIMMED .*/$TRIMMED ${!OUTPUT}/" -i /etc/clamav/clamd.conf ||
	    sed "$ a\\$TRIMMED ${!OUTPUT}" -i /etc/clamav/clamd.conf
done

for OUTPUT in $(env | awk -F "=" '{print $1}' | grep "^FRESHCLAM_CONF_")
do
	TRIMMED=$(echo $OUTPUT | sed 's/FRESHCLAM_CONF_//g')
	grep -q "^$TRIMMED " /etc/clamav/freshclam.conf && sed "s/^$TRIMMED .*/$TRIMMED ${!OUTPUT}/" -i /etc/clamav/freshclam.conf ||
	    sed "$ a\\$TRIMMED ${!OUTPUT}" -i /etc/clamav/freshclam.conf
done

# start clam service itself and the updater in background as daemon
freshclam -d &
clamd &

# recognize PIDs
pidlist=`jobs -p`

# initialize latest result var
latest_exit=0

# define shutdown helper
function shutdown() {
    trap "" SIGINT

    for single in $pidlist; do
        if ! kill -0 $single 2>/dev/null; then
            wait $single
            latest_exit=$?
        fi
    done

    kill $pidlist 2>/dev/null
}

# run shutdown
trap shutdown SIGINT
wait -n

# return received result
exit $latest_exit
© 2020 GitHub, Inc.