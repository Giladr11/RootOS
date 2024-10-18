#!/bin/bash
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

make all

echo "=============================================="

echo "Calculating Kernel's Checksum ->
"

# output=$(./build/boot/stage2/include/preboot_crc32_calc.exe)
echo | crc32 "build/kernel/kernel.bin"
 
# echo -n $output | xxd -r -p > build/boot/stage2/crc32/preboot_crc32_result.bin
crc32 build/kernel/kernel.bin | xxd -p -r > build/boot/stage2/crc32/preboot_crc32_result.bin