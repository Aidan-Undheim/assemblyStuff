	global	_start

	section	.data
number:	dd	69420

	section	.bss
digits:	resb	16
len:	resb	1

	section	.text
_start:	xor	rcx, rcx		; index = 0
	mov	rbx, digits		; rbx keeps track of digit bytes
	mov	eax, [number]	; store number to be divided

loop:	push	rbx		; rbx will be changed for division
	
	xor	edx, edx		; div works as dx:ax / 10
	
	mov	ebx, 10		
	div	ebx		; eax / 10

	pop	rbx		; restore rbx
	
	push	rbx

	add	rbx, rcx
	add	edx, 48
	mov	[rbx], edx		; digits[i] = str(remainder)

	pop	rbx

	inc	rcx		; i++

	cmp	eax, 0
	jle	end

	cmp	rcx, 15		
	jge	end		; loop if i < 15 (saving 16 for a newline)
	jmp	loop

end:	mov	rax, digits
	add	rax, rcx
	mov	byte[rax], 0xA
	dec	rax
	
loop2:	mov	dl, byte[rbx]
	mov	cl, [rax]
	mov	byte[rbx], cl
	mov	byte[rax], dl
	dec	rax
	inc	rbx
	cmp	rax, rbx
	jg	loop2
	
end2:	mov	rax, 1
	mov	rdi, 1
	mov	rsi, digits
	mov	rdx, 16
	syscall			; print result

	mov	rax, 60
	xor	rdi, rdi
	syscall			; exit without segfault
