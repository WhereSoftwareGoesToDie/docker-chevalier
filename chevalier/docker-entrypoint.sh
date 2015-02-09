#!/bin/bash
set -e

CONFIG_FILE=/etc/chevalier.gcfg


# Replace KEY with VALUE in FILE
function set_config() {
	sed -i "s/\($1 *= *\).*/\1$2/" $3
}

if [ -z "$ES_HOST" ]; then
	echo >&2 "error: missing ES_HOST environment variable. Defaulting to the value in $CONFIG_FILE"
else
	set_config "host" $ES_HOST /etc/chevalier.gcfg
fi

if [ -z "$CONTENTS_HOST" ]; then
	echo >&2 "error: missing CONTENTS_HOST environment variable. Defaulting to the value in $CONFIG_FILE"
else
	CONTENTS_TCP="tcp:\/\/$CONTENTS_HOST:5580"
	set_config "contentsendpoint" $CONTENTS_TCP /etc/chevalier.gcfg
fi

cat /etc/chevalier.gcfg

chevalierd -read
