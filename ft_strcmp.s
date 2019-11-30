global _ft_strcmp

;int	ft_strcmp(const char *, const char *)
_ft_strcmp:
	xor rcx, rcx
	xor rax, rax
	xor rdx, rdx
ft_strcmp_loop:
	mov al, [rdi]
	mov cl, [rsi]
	cmp al, cl
	jnz ft_strcmp_end
	cmp cl, 0
	jz ft_strcmp_end
	inc rdi
	inc rsi
	jmp ft_strcmp_loop

ft_strcmp_end:
	sub ax, cx
	cwde
	cdqe
	ret
