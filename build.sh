#!/bin/bash
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

echo "Building Booting Process ->"
echo -e "----------------------------\n"

make build/boot/mbr/bootsec.bin

make build/boot/stage2/loader.bin

echo -e "\n==================================================================\n"

echo "Building Kernel ->"
echo -e "-------------------\n"

make build/kernel/kernel.bin

echo -e "\n==================================================================\n"

echo "Building Pre-Boot CRC-32 Calculation ->"
echo -e "----------------------------------------\n"

make build/boot/stage2/include/preboot_crc32_calc.exe

echo -e "\nCalculating Pre-Boot Kernel CRC-32 Checksum ->"
echo -e "-----------------------------------------------\n"

RESULT=$(./build/boot/stage2/include/preboot_crc32_calc.exe)
 
echo "Pre-Boot Kernel's CRC-32 Checksum Result: $RESULT"

echo -n $RESULT | xxd -p -r > build/boot/stage2/crc32/preboot_crc32_result.bin

echo -e "\n==================================================================\n"

echo "Building Disk Image ->"
echo -e "-----------------------\n"

make build/disk.img