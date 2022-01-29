MAGIC       equ    0x1BAD8002
FLAGS       equ    0
CHECKSUM   equ    -(MAGIC + FLAGS)


	section .multiboot
dd MAGIC
dd FLAGS
dd CHECKSUM


	section .bss
align 16
stack_bottom:
resb 16384
stack_top:


	section .text
global _start
_start:
	mov eax, stack_top

	extern kernel_main
	call kernel_main

	cli
.halt:	hlt
	jmp .halt
