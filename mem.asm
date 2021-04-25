	global	_start

	section	.text
_start:	
	mov	ebx, pref
	add	ebx, preflen
	sub	ebx, 2

	mov	byte[ebx], 0x41

	mov	rax, 1
	mov	rdi, 1
	mov	rsi, pref
	mov	rdx, preflen
	syscall

	mov	rax, 60
	xor	rdi, rdi
	syscall

	section	.bss
msg:	resb	1


	section	.data
pref:	db	"number: p", 0xA
preflen:	equ	$ - pref
