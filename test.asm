global	_start

	section	.text
_start:	mov	rax, 1
	mov	rdi, 1
	mov	rsi, message
	mov	rdx, len
	syscall
	mov	rax, 60
	xor	rdi, rdi
	syscall

	section	.data
message:	db	"Isn't assembly exciting?", 0xA
len	equ	$-message
