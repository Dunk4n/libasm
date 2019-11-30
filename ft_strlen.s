global _ft_strlen

; int ft_strlen(char *);
_ft_strlen:
	push rcx
	xor rcx, rcx

strlen_next:
	cmp [rdi + rcx], byte 0
	jz strlen_end
	inc rcx
	jmp strlen_next

strlen_end:
	mov rax, rcx

	pop rcx
	ret
