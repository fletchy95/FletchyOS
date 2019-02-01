#include"kernel.h"

// now we need a function that will return a value of each 16 bit pixel of the character that we want to display on a screen with a color
// to do that we must return a 16 bit value, because our TERMINAL_BUFFER is of type 16 bit (duh)
static UINT16 VGA_DefaultEntry(unsigned char to_print){
	// the left shift will convert the white color value to some drawable character value in pixel format encoding with that character that
	// we want to print, that wahy we took bitwise of it not 'and'
	return (UINT16) to_print | (UINT16)WHITE_COLOR << 8;
}

// now main function which has been called in boot.S file
void KERNEL_MAIN()
{
	// first lets initialize a TERMINAL_BUFFER pointer, points to a VGA address
	// but we need to cast it to UINT16 type
	TERMINAL_BUFFER = (UINT16*) VGA_ADDRESS;

	// now you can access a VGA using a simple array acessing using a index as you usually do in array
	// lets do same, but here we need a value that we need to print in pixel format so we will call above fucntion returned value
	TERMINAL_BUFFER[0] = VGA_DefaultEntry('H');
        TERMINAL_BUFFER[1] = VGA_DefaultEntry('e');
        TERMINAL_BUFFER[2] = VGA_DefaultEntry('l');
        TERMINAL_BUFFER[3] = VGA_DefaultEntry('l');
        TERMINAL_BUFFER[4] = VGA_DefaultEntry('o');
        TERMINAL_BUFFER[5] = VGA_DefaultEntry(' ');
        TERMINAL_BUFFER[6] = VGA_DefaultEntry('W');
        TERMINAL_BUFFER[7] = VGA_DefaultEntry('o');
        TERMINAL_BUFFER[8] = VGA_DefaultEntry('r');
        TERMINAL_BUFFER[9] = VGA_DefaultEntry('l');
        TERMINAL_BUFFER[10] = VGA_DefaultEntry('d');
}
