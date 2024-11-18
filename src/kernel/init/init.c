#include "include/arch/x86/idt.h"
#include "include/arch/x86/isr.h"
#include "include/arch/x86/cpu_io.h"

void kernel_main() {
    IDT_Initialize();
    ISR_Initialize();

    set_int_flag();

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
   

    
