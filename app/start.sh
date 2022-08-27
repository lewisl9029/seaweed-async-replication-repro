#!/usr/bin/env sh
set -e

if [ "$FLY_REGION" = "sjc" ]; then
  /usr/local/bin/hivemind Procfile.primary
  exit 0
else
  /usr/local/bin/hivemind Procfile
  exit 0
fi


