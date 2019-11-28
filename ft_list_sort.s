# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_sort.s                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: niduches <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/28 11:14:12 by niduches          #+#    #+#              #
#    Updated: 2019/11/28 11:14:14 by niduches         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_list_sort

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

	push rbx

ft_is_sort_while:
	xor rbx, rbx
	mov rcx, qword [rdi]

	cmp qword [rcx + 8], 0
	jz ft_is_sort_while2_end
	ft_is_sort_while2:
		push r8
		push r9
		push rdi
		push rsi

		mov r8, rsi
		mov rdi, [rcx]
		mov r9, qword [rcx + 8]
		mov rsi, [r9]
		call r8
		cmp al, byte 0
		pop rsi
		pop rdi
		jg ft_list_sort_if
		ft_list_sort_if_back:

		pop r9
		pop r8

		mov rcx, qword [rcx + 8]
		cmp qword [rcx + 8], 0
		jnz ft_is_sort_while2
	ft_is_sort_while2_end:

	cmp rbx, 0
	jnz ft_is_sort_while

	pop rbx
	pop rcx
	ret

ft_list_sort_error:
	pop rcx
	ret


ft_list_sort_if:
	push rbx
	push r10

	mov rbx, [rcx]
	mov r10, [r9]
	mov [rcx], r10
	mov [r9], rbx

	pop r10
	pop rbx
	mov rbx, 1
	jmp ft_list_sort_if_back
