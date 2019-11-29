
extern _free
extern _free_moi
extern _op

global _test
_test:
	sub rsp, 8
	call _free
	add rsp, 8
	ret

global _ft_list_remove_if

ft_list_remove_if_error:
	ret

; void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *))
; rdi begin_list
; rsi data_ref
; rdx cmp
; rcx free_fct
_ft_list_remove_if:
	cmp rdi, 0
	jz ft_list_remove_if_error
	cmp qword [rdi], 0
	jz ft_list_remove_if_error
	cmp rdx, 0
	jz ft_list_remove_if_error
	cmp rcx, 0
	jz ft_list_remove_if_error

	push qword rbx	; next
	push qword r8		; tmp

ft_list_remove_if_while_cond:
	cmp qword [rdi], 0
	jz ft_list_remove_if_end
	push qword rdi
	mov r8, qword [rdi]
	mov rdi, qword [r8]
	call rdx
	pop rdi
	cmp rax, 0
	jnz ft_list_remove_if_while_end
ft_list_remove_if_while:
	mov rbx, qword [rdi]
	mov r8, qword [rbx + 8]
	mov qword [rdi], r8
	push qword rdi
	push qword rsi
	push qword rcx

;	sub rsp, 8

	mov rdi, qword [rbx]
	call _free ; rcx

;	add rsp, 8

	mov rcx, 0
	mov rdi, rbx
	call _free

	pop rcx
	pop rsi
	pop rdi
	jmp ft_list_remove_if_while_cond
ft_list_remove_if_while_end:

;ici
	pop r8
	pop rbx
	ret

	mov r8, qword [rdi]
	mov rbx, qword [r8 + 8]

ft_list_remove_if_while_cond2:
	cmp rbx, 0
	jz ft_list_remove_if_end
ft_list_remove_if_while2:
	push rdi
	mov rdi, qword [rbx]
	call rdx
	pop rdi
	cmp rax, 0
	jz ft_list_remove_if_if
ft_list_remove_if_if_return:
	mov r8, rbx
	mov rbx, qword [r8 + 8]
	jmp ft_list_remove_if_while_cond2

ft_list_remove_if_end:
	pop r8
	pop rbx
	ret

ft_list_remove_if_if:
	push r9

	mov r9, qword [rbx + 8]
	mov qword [r8 + 8], r9

	pop r9
	jmp ft_list_remove_if_if_return

jump_end:
	mov rax, rsp
	pop rcx
	pop rsi
	pop rdi
	pop r8
	pop rbx
	ret

