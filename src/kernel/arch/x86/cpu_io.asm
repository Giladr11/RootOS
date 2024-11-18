[BITS 32]

; Hardware I/O

global outb
outb:
    mov dx, [esp + 4]       ; Load the I/O port number into 'dx'
    mov al, [esp + 8]       ; Load the data into 'al'
    out dx, al              ; Send data in al to the I/O port in 'dx'
    ret

global inb
inb:
    mov dx, [esp + 4]       ; Load the I/O port number into 'dx'
    xor eax, eax            ; Clear 'eax'
    in al, dx               ; Read data from I/O port in 'dx' into al
    ret

global set_int_flag
set_int_flag:
    sti
    ret

global clear_int_flag
clear_int_flag:
    cli 
    hlt