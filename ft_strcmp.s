global _ft_strcmp

;int	ft_strcmp(const char *, const char *)
_ft_strcmp:
	push rcx
	push rbx

	xor rcx, rcx
	xor rbx, rbx

ft_strcmp_loop:
	mov bl, [rdi + rcx]
	cmp bl, [rsi + rcx]
	jnz ft_strcmp_end
	inc rcx
	jmp ft_strcmp_loop

ft_strcmp_end:
	xor rax, rax
	mov al, [rdi + rcx]
	sub al, [rsi + rcx]
	pop rbx
	pop rcx
	ret
