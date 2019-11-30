global _ft_list_size

; int     ft_list_size(t_list *begin_list)
_ft_list_size:
	push rdi

	xor rax, rax
ft_list_size_while:
	cmp rdi, 0
	jz ft_list_size_end
	inc rax
	mov rdi, [rdi + 8]
	jmp ft_list_size_while

ft_list_size_end:
	pop rdi
	ret
