global _ft_strcmp

;int	ft_strcmp(const char *, const char *)
_ft_strcmp:
	xor rcx, rcx
	xor rax, rax
ft_strcmp_loop:
	mov cl, byte [rdi]
	cmp ecx, dword [rsi]
	jnz ft_strcmp_end
	cmp ecx, 0
	jz ft_strcmp_end
	inc rdi
	inc rsi
	jmp ft_strcmp_loop

ft_strcmp_end:
	sub ecx, dword [rsi]
	mov eax, ecx
	ret
