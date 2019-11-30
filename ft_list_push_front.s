extern _malloc
global _ft_create_elem
global _ft_list_push_front

; t_list	*ft_create_elem(void *data)
_ft_create_elem:
	push rdi

	mov rdi, 16
	call _malloc
	pop rdi
	cmp rax, 0
	jz ft_create_elem_end
	mov [rax], rdi
	add rax, 8
	mov qword [rax], 0
	sub rax, 8

ft_create_elem_end:
	ret

; void		ft_list_push_front(t_list **begin_list, void *data);
;	rdi = begin_list
;	rsi = data
_ft_list_push_front:
	cmp rdi, 0
	jz ft_list_push_front_end
	push rdi

	mov rdi, rsi
	call _ft_create_elem

	pop rdi
	cmp rax, 0
	jz ft_list_push_front_end

	add rax, 8

	push rbx

	mov rbx, [rdi]
	mov [rax], rbx
	sub rax, 8
	mov [rdi], rax

	pop rbx
ft_list_push_front_end:
	ret
