#include "include/kernel.h"

void kernel_main() {
    *((char*)0xb8000) = 'Z';
}
    
