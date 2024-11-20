#include "include/arch/x86/isr/isr.h"
#include "include/arch/x86/idt/idt.h"
#include "include/arch/x86/cpu/io.h"

ISRHandler g_ISRHandlers[256];

void ISR_InitializeGates();

void ISR_Initialize() {
    ISR_InitializeGates();
    for (int i = 0; i < 256; i++)
    {
        IDT_EnableGate(i);
    }
}

void __attribute__((cdecl)) ISR_Handler(Registers* regs) 
{
    if (g_ISRHandlers[regs->interrupt] != NULL) {
        g_ISRHandlers[regs->interrupt](regs);
    }

    else if (regs->interrupt >= 32){
        char string1[20] = "Unhandled Interrupt!";

        int pos = 0;
        while(pos < 20)
        {
            *((char*)0xb8000 + pos * 2) = string1[pos];        
            *((char*)0xb8000 + pos * 2 + 1) = 0x07;    
            pos ++; 
        }   
    }

    else if (regs->interrupt == 2) {
        char string1[22] = "Unhandled Interrupt 2!";

        int pos = 0;
        while(pos < 22)
        {
            *((char*)0xb8000 + pos * 2) = string1[pos];        
            *((char*)0xb8000 + pos * 2 + 1) = 0x07;    
            pos ++; 
        }   
    }

    // else {
        // char string2[20] = "Unhandled Exception!";

        // int pos = 0;
        // while(pos < 20)
        // {
        //     *((char*)0xb8000 + pos * 2) = string2[pos];        
        //     *((char*)0xb8000 + pos * 2 + 1) = 0x07;    
        //     pos ++; 
        // }   

        // // printf("Unhandled exception %d %s\n", regs->interrupt, g_Exceptions[regs->interrupt]);
        
        // // printf("  eax=%x  ebx=%x  ecx=%x  edx=%x  esi=%x  edi=%x\n",
        // //        regs->eax, regs->ebx, regs->ecx, regs->edx, regs->esi, regs->edi);

        // // printf("  esp=%x  ebp=%x  eip=%x  eflags=%x  cs=%x  ds=%x  ss=%x\n",
        // //        regs->esp, regs->ebp, regs->eip, regs->eflags, regs->cs, regs->ds, regs->ss);

        // // printf("  interrupt=%x  errorcode=%x\n", regs->interrupt, regs->error);

        // // printf("KERNEL PANIC!\n");
        // CLEAR_INT_FLAG();
    //}
}

