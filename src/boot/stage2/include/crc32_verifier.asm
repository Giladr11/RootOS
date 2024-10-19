;CRC-32 Verification
section .data
    KERNEL_SIZE equ 5828

section .bss
    kernel_checksum_file_buffer resd 0x01
    kernel_checksum_calc_result resd 0x01
    read_kernel_buffer          resb KERNEL_SIZE


section .text
CalcKernelChecksum:
    mov esi, read_kernel_buffer
    mov ecx, KERNEL_SIZE
    
    call _start_crc32
    
    mov [kernel_checksum_calc_result], ebx 

    ret

CompareChecksums:
    mov edx, [kernel_checksum_calc_result]
    mov ecx, 0xc0ce2b76

    cmp edx, ecx
    jne print_not_match

    call print_match

    ret

print_not_match:
    mov si, checksums_not_match
    call print

    jmp $

print_match:
    mov si, checksums_match
    call print

    ret


checksums_not_match db "[-][ERROR]: Kernel CRC-32 Checksums Do not Match!", 0x0D, 0x0A, 0x0D, 0x0A, 0
checksums_match     db "[+] Kernel CRC-32 Verificitation has Completed!"  , 0x0D, 0x0A, 0x0D, 0x0A, 0


%include "src/boot/stage2/include/crc32.asm"
%include "src/boot/print16.asm"