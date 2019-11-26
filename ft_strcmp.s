global _ft_strcmp

;int	ft_strcmp(const char *, const char *)
_ft_strcmp:
	push rcx

	xor rcx, rcx

ft_strcmp_loop:
	mov al, byte [rdi + rcx]
	cmp al, byte [rsi + rcx]
	jnz ft_strcmp_end
	cmp al, 0
	jz ft_strcmp_end
	inc rcx
	jmp ft_strcmp_loop

ft_strcmp_end:
	sub al, byte [rsi + rcx]
	pop rcx
	ret
