[BITS 32]                        

global _start

extern kernel_main

_start:
    call kernel_main
    jmp $

times 508 - ($ - $$) db 0        ; Fill remaining sector space with 0
