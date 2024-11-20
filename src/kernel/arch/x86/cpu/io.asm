[BITS 32]

; CPU I/O

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

global SET_INT_FLAG
SET_INT_FLAG:
    sti
    ret

global CLEAR_INT_FLAG
CLEAR_INT_FLAG:
    cli 
    ret

global KERNEL_PANIC
KERNEL_PANIC:
    cli
    hlt