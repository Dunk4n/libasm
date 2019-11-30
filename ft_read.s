global _ft_read

;ssize_t	ft_read(int, const void *, size_t)
_ft_read:
	mov rax, 0x2000003
	syscall
	ret
