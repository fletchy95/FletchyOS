#this file is a bootloader file which will instruct the grub bootloader to load our kernel

#first set magic number of multiboot
.set MAGIC,	0x1BADB002

#set flags
.set FLAGS,	0

#set checksum
.set CHECKSUM, -(MAGIC + FLAGS)

#we dont need ot her fields
#set multiboot section
.section .multiboot

#set types for MAGIC, Flags etc
.long MAGIC
.long FLAGS
.long CHECKSUM

#now we need stack for our kernel fuctions
#stack grows from higer memory to lower first in last out structure
stackBottom:

#say we need 512 stack size
#so skip those
.skip 512

#set stack top now
stackTop:

#set sections
.section .text
.global _start
.type _start, @function

#so lets start with a starting point

_start:

	#get the current stack pointer from esp
	mov $stackTop, %esp
	
	#call the main kernel
	call KERNEL_MAIN

	#clear the interrupts
	cli

#put system in infinite loop
hltLoop:

	hlt
	jmp hltLoop

.size _start, . - _start

