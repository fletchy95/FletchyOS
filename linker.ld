/* this is a linker file to link all the sections together, but each section requires a memory to bink it together.  
 * It will also bind our kernel main source, so we need not to worry about linking it externally */

/* first set entry point of our bootloader main */ 
ENTRY(_start)  
  
SECTIONS  
{  
    /* we need 1MB of space atleast */  
    . = 1M;  
  
    /* text section */  
    .text BLOCK(4K) : ALIGN(4K)  
    {  
        *(.multiboot)  
        *(.text)  
    }  
  
    /* read only data section */  
    .rodata BLOCK(4K) : ALIGN(4K)  
    {  
        *(.rodata)  
 
    }
    /* data section */  
    .data BLOCK(4K) : ALIGN(4K)  
    {  
        *(.data)  
    }  
  
    /* bss section */  
    .bss BLOCK(4K) : ALIGN(4K)  
    {  
        *(COMMON)  
        *(.bss)  
    }  
}

