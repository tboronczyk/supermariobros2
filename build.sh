#! /bin/sh

set -e

if [ "$#" -ne 1 ]; then
    echo "usage: $(basename "$0") ROM" 1>&2
    exit
fi
ROM="$1"

echo "\nAssemble ROM"
cd smb2
sh build.sh || true
cp bin/smb2.nes ../$ROM
cd ..
