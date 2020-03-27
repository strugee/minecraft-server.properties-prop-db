#!/bin/sh

set -eu

echo Retrieving server download URL.
URL=$(curl https://www.minecraft.net/en-us/download/server/ | grep launcher.mojang.com | cut -d'"' -f2)
echo Using $URL.

echo Downloading server.
curl $URL > server.jar

echo Running server.
test -f server.properties && rm server.properties

java -jar server.jar

echo Cleaning up.
rm -r logs/ eula.txt server.jar

