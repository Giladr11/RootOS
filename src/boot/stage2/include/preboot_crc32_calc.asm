; Pre-Boot CRC-32 Calculation


section .data
    KERNEL_SECTOR           equ 0x07
    KERNEL_SECTOR_COUNT     equ 0x0C
    KERNEL_SIZE             equ 5828  

section .bss
    read_kernel_buffer resb KERNEL_SIZE  
    crc32_result resd 1 

section .text
    global _start

_start:

    call read_kernel
    mov esi, read_kernel_buffer
    mov ecx, KERNEL_SIZE

    call _start_crc32

    mov [crc32_result], ebx

    call write_sectors

read_kernel:
    mov ah, 0x02                    
    mov dl, 0x80                    
    mov dh, 0x00                    
    mov ch, 0x00                    
    mov cl, KERNEL_SECTOR           
    mov al, KERNEL_SECTOR_COUNT     
 
    ;mov bx, read_kernel_buffer  

    int 0x13                        
    ret

write_sectors:
    ret

%include "src/boot/stage2/include/crc32.asm"
