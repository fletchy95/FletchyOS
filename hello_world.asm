;bootloader begin
[bits 16]
[org 0x7C00]

start:

	xor ax, ax
	mov ds, ax
	mov es, ax

	mov ah, 0x02
	mov al, 0x10
	mov dl, 0x80
	mov ch, 0
	mov dh, 0
	mov cl, 2
	mov bx, _start ; where to jump
	int 0x13

	cli

	jmp _start

	times (510 - ($ - $$)) db 0x00
	dw 0xAA55

;bootloader end

;kernel begin

_start:

main:

	mov ebp, _HEAP_
	mov esp, _STACK_
	
	lea ebx, [msg]
	push ebx
	call print_string
	add esp, 4


	hlt

print_string:

	push ebp
	mov ebx, dword[ebp - 8]
	mov ecx, 0

.print_loop:

	cmp byte[ebx + ecx], 0
	je .exit

	mov al, byte[ebx +ecx]
	mov ah, 0x0E
	int 0x10

	inc ecx

	jmp .print_loop

.exit:
	pop ebp
	ret

;kernel end
	times (1022 - ($ - $$)) db 0x00

section .rodata
	_STACK_ dd 0x00FFFFFF
	_HEAP_ dd 0x00008C24

section .data
	msg db 'Hello, welcome to FletchyOS!', 0
