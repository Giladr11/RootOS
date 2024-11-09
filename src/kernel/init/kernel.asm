global _start

extern kernel_main

_start:
    jmp kernel_main

times 512 - ($ - $$) db 0        ; Fill remaining sector space with 0
