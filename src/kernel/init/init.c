#include "/mnt/usb/RootOS/src/kernel/include/arch/x86/idt.h"

void kernel_main() {
    IDT_Initialize();

    char string[18] = {'K', 'e', 'r', 'n', 'e', 'l', ' ', 'i', 's', ' ', 'R', 'u', 'n', 'n', 'i', 'n', 'g', '!'};

    int pos = 0;
    while(pos < 18)
    {
        *((char*)0xb8000 + pos * 2) = string[pos];        
        *((char*)0xb8000 + pos * 2 + 1) = 0x07;    
        pos ++; 
    }
    while(1){}
}
   

    
