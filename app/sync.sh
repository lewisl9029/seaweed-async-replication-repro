#!/bin/sh
set -e

# Sync will exit at startup when seaweed isn't reachable
# Retry until it succeeds
while true; do    
    weed filer.sync -a localhost:8888 -b $STORAGE_PRIMARY_HOSTNAME:8888 || true
    sleep 5
done
