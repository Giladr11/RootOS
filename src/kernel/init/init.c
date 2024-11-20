#include "include/arch/x86/idt/idt.h"
#include "include/arch/x86/isr/isr.h"
#include "include/arch/x86/cpu/io.h"

void kernel_main() {
    IDT_Initialize();
    ISR_Initialize();

    SET_INT_FLAG();

    __asm__ volatile ("int $0x2");

    for(;;);

    // char string[18] = "kernel is running!";

    // int pos = 0;
    // while(pos < 18)
    // {
    //     *((char*)0xb8000 + pos * 2) = string[pos];        
    //     *((char*)0xb8000 + pos * 2 + 1) = 0x07;    
    //     pos ++; 
    // }
    // while(1){}
}
   

    
