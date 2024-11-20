#ifndef IO_H
#define IO_H

#include "include/stdint.h"

void __attribute__((cdecl)) outb(uint16_t port, uint8_t value);
uint8_t __attribute__((cdecl)) inb(uint16_t port);

void __attribute__((cdecl)) CLEAR_INT_FLAG();

void __attribute__((cdecl)) SET_INT_FLAG();

#endif