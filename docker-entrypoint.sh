#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for yiyad"

  set -- yiyad "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "yiyad" ]; then
  mkdir -p "$YIYA_DATA"
  chmod 700 "$YIYA_DATA"
  chown -R root "$YIYA_DATA"

  echo "$0: setting data directory to $YIYA_DATA"

  set -- "$@" -datadir="$YIYA_DATA"
fi

if [ "$1" = "yiyad" ] || [ "$1" = "yiya-cli" ] || [ "$1" = "yiya-tx" ]; then
  echo
  exec su-exec root "$@"
fi

echo
exec "$@"