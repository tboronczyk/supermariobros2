#! /bin/sh

set -e

ORIG='Super Mario Bros 2 (USA) (Rev A).nes'
ROM="supermariobros2-eo.nes"
IPS="supermariobros2-eo.ips"
FLIPS="wine /opt/floating/flips.exe"

echo "Assembling ROM..."
cd smb2
sh build.sh || true
cp bin/smb2.nes ../$ROM
cd ..

echo "Updating CHR..."
dd if=chr/cx.bin of="$ROM" conv=notrunc bs=1 seek=$((0x2AEB0))
dd if=chr/gx.bin of="$ROM" conv=notrunc bs=1 seek=$((0x2AF10))
dd if=chr/jx.bin of="$ROM" conv=notrunc bs=1 seek=$((0x2AD00))
dd if=chr/sx.bin of="$ROM" conv=notrunc bs=1 seek=$((0x2AF20))
dd if=chr/ux.bin of="$ROM" conv=notrunc bs=1 seek=$((0x2AF30))
dd if=chr/ux.bin of="$ROM" conv=notrunc bs=1 seek=$((0x2BF30))
dd if=chr/ux.bin of="$ROM" conv=notrunc bs=1 seek=$((0x2DF30))
dd if=chr/ux.bin of="$ROM" conv=notrunc bs=1 seek=$((0x2EF30))
dd if=chr/ux.bin of="$ROM" conv=notrunc bs=1 seek=$((0x30730))
dd if=chr/ux.bin of="$ROM" conv=notrunc bs=1 seek=$((0x30F30))
dd if=chr/ux.bin of="$ROM" conv=notrunc bs=1 seek=$((0x31730))
dd if=chr/ux.bin of="$ROM" conv=notrunc bs=1 seek=$((0x31F30))
dd if=chr/z.bin of="$ROM" conv=notrunc bs=1 seek=$((0x30720))
dd if=chr/z.bin of="$ROM" conv=notrunc bs=1 seek=$((0x30F20))
dd if=chr/z.bin of="$ROM" conv=notrunc bs=1 seek=$((0x31720))
dd if=chr/z.bin of="$ROM" conv=notrunc bs=1 seek=$((0x31F20))
dd if=chr/plus.bin of="$ROM" conv=notrunc bs=1 seek=$((0x2DFB0))
dd if=chr/bomb.bin of="$ROM" conv=notrunc bs=1 seek=$((0x22210))
dd if=chr/1up.bin of="$ROM" conv=notrunc bs=1 seek=$((0x22710))
dd if=chr/pow1.bin of="$ROM" conv=notrunc bs=1 seek=$((0x26410))
dd if=chr/pow2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x26C10))
dd if=chr/pow3.bin of="$ROM" conv=notrunc bs=1 seek=$((0x27410))
dd if=chr/pow4.bin of="$ROM" conv=notrunc bs=1 seek=$((0x27C10))
dd if=chr/pow5.bin of="$ROM" conv=notrunc bs=1 seek=$((0x28410))
dd if=chr/pow6.bin of="$ROM" conv=notrunc bs=1 seek=$((0x28C10))
dd if=chr/pow7.bin of="$ROM" conv=notrunc bs=1 seek=$((0x29410))
dd if=chr/pow8.bin of="$ROM" conv=notrunc bs=1 seek=$((0x29C10))
dd if=chr/bonus.bin of="$ROM" conv=notrunc bs=1 seek=$((0x2DAD0))
dd if=chr/theend.bin of="$ROM" conv=notrunc bs=1 seek=$((0x32110))

echo "Generating patch..."
$FLIPS -c -i "$ORIG" "$ROM" "$IPS"

echo "Done"
