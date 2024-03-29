extern _malloc
extern _ft_strlen
extern _ft_strcpy
global _ft_strdup

; int ft_strdup(const char *);
_ft_strdup:
	push rdi

	call _ft_strlen
	mov rdi, rax
	inc rdi
	call _malloc
	cmp rax, 0
	jz ft_strdup_end

	pop rdi
	push rdi
	push rsi

	mov rsi, rdi
	mov rdi, rax
	call _ft_strcpy

	pop rsi
ft_strdup_end:
	pop rdi
	ret
