[BITS 32]

global IDT_LOAD

IDT_LOAD:
    push ebp          ; Save old call frame
    mov ebp, esp      ; Initialize new call frame

    mov eax, [ebp + 8]
    lidt [eax]

    ;restore old call frame
    mov esp, ebp 
    pop ebp
    ret