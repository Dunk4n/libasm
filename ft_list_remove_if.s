extern _free
global _ft_list_remove_if

ft_list_remove_if_error:
	ret
; void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
;void (*free_fct)(void *))
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

	push rbx		; next
	push r8			; tmp

while_start_cond:
	cmp qword [rdi], 0
	jz exit
	push rdi
	push rsi
	push rcx
	push rdx

	mov r8, qword [rdi]
	mov rdi, qword [r8]
	call rdx

	pop rdx
	pop rcx
	pop rsi
	pop rdi
	cmp rax, 0
	jnz while_start_end
	
	mov rbx, qword [rdi]
	mov r8, qword [rbx + 8]
	mov [rdi], r8
	push rdi
	push rsi
	push rcx
	push rdx

	push rbx
	mov rdi, [rbx]
	call rcx

	pop rbx
	push rbx
	mov rdi, rbx
	call _free
	pop rbx

	pop rdx
	pop rcx
	pop rsi
	pop rdi

	jmp while_start_cond
while_start_end:
	cmp qword [rdi], 0
	jz exit

	mov r8, [rdi]
	mov rbx, [r8 + 8]

while_cond:
	cmp qword rbx, 0
	jz exit

	push r8
	push rdi
	push rsi
	push rcx
	push rdx

	mov rdi, qword [rbx]
	call rdx

	pop rdx
	pop rcx
	pop rsi
	pop rdi
	pop r8
	cmp rax, 0
	jnz while_end

	push rcx
	mov rcx, qword [rbx + 8]
	mov qword [r8 + 8], rcx
	pop rcx
	push r8
;free
		push	rsi
		push	rdx
		push	rcx
		push	rdi
	mov rdi, [rbx]
		call	rcx
		pop		rdi
		push	rdi
	mov rdi, rbx
		call	_free
		pop		rdi
		pop		rcx
		pop		rdx
		pop		rsi
;free
	pop r8
	mov rbx, qword [r8 + 8]
	jmp while_cond
while_end:
	mov r8, rbx
	mov rbx, [r8 + 8]
	jmp while_cond

exit:
	pop r8
	pop rbx
	ret
