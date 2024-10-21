#!/bin/bash
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

make all

echo "=============================================="

echo "Calculating Kernel's Checksum ->
"

RESULT=$(./build/boot/stage2/include/preboot_crc32_calc.exe)
 
echo "Checksum Result: $RESULT"

echo -n $RESULT | xxd -p -r > build/boot/stage2/crc32/preboot_crc32_result.bin


