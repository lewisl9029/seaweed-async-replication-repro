#!/bin/sh
set -e

weed server -ip.bind=[::] -dir=/data -filer=true -filer.saveToFilerLimit=1024 -filer.port=8888 -master.port=9333 -volume.port=8080 
