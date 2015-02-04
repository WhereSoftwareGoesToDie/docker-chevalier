#!/bin/bash
set -e

# having a container aliased as "es" and exposing port 9200 generates 
# the environment variable ES_PORT_9200_TCP. Explode if we don't see
# this special port opened

if [ -z "$ES_PORT_9200_TCP" ]; then
	echo >&2 "error: missing ES_PORT_9200_TCP environment variable"
	echo >&2 "   Did you forget to --link my_elasticsearch:es ?"
	exit 1
fi

exec "$@"

