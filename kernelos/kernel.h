#ifndef _KERNEL_H_
#define _KERNEL_H_
// lets define a VGA address
#define VGA_ADDRESS 0xB8000
// a 16 bit is 0xB8000 meanwhile 32 bit is 0x0A0000
// this will give us a resolution of 80x24 pixels

// we also need a default color to display characters
#define WHITE_COLOR 15

// lets define a 16 bit unsigned type
typedef unsigned short UINT16;

//now we need a buffer that points to a VGA aka VGA_BUFFER
UINT16* TERMINAL_BUFFER;

#endif

