global _ft_list_sort

ft_list_sort_error:
	pop rcx
	ret
; void	ft_list_sort(t_list **begin_list, int (*cmp)())
;	rdi = begin_list
;	rsi = cmp
_ft_list_sort:
	push rcx

	cmp rsi, 0
	jz ft_list_sort_error
	cmp rdi, 0
	jz ft_list_sort_error
	cmp qword [rdi], 0
	jz ft_list_sort_error
	mov rcx, [rdi]
	cmp qword [rcx + 8], 0
	jz ft_list_sort_error

	pop rcx
	push r8
while_start:
	xor r8, r8
	push rcx
	mov rcx, qword [rdi]
	push rsi
	push rdi

	jmp while_start2
	while_end2:

	pop rdi
	pop rsi
	pop rcx
	cmp r8, 1
	jz while_start

	pop r8
	ret

while_start2:
	push rcx
	push rsi
	push r8
	push r9
	
	push	rdi
	mov rax, rsi
	mov rdi, qword [rcx]
	mov r9, qword [rcx + 8]
	mov rsi, qword [r9]

	call	rax
	pop		rdi
	cmp		eax, 0

	pop r9
	pop r8
	pop rsi
	pop rcx

	jle while_next2
	push r9
	push r10
	push r11

	mov r9, qword [rcx]
	mov r10, qword [rcx + 8]
	mov r11, qword[r10]
	mov qword [rcx], r11
	mov qword [r10], r9

	pop r11
	pop r10
	pop r9
	mov r8, 1
while_next2:
	mov rcx, qword [rcx + 8]
	cmp qword [rcx + 8], 0
	jnz while_start2
jmp while_end2
