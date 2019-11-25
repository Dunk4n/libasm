SECTION .TEXT
	global ft_strlen

; int ft_strlen(char *);
ft_strlen:
	push rcx
	xor rcx, rcx

strlen_next:
	cmp [rdi], byte 0
	jz strlen_end
	inc rcx
	inc rdi
	jmp strlen_next

strlen_end:
	mov rax, rcx

	pop rcx
	ret
