# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_atoi_base.s                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: niduches <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/27 16:34:42 by niduches          #+#    #+#              #
#    Updated: 2019/11/27 16:35:27 by niduches         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_atoi_base

;int	good_arg(char *)
_good_arg:						; check if the base is good and return his length
	push rsi

	cmp rsi, 0
	jz good_arg_end_error
	cmp byte [rsi], 0
	jz good_arg_end_error
	cmp byte [rsi + 1], 0
	jz good_arg_end_error

good_arg_while1:
	cmp byte [rsi], 43			; if *rsi == '+'
	jz good_arg_end_error
	cmp byte [rsi], 45			; if *rsi == '-'
	jz good_arg_end_error
	cmp byte [rsi], 32			; if *rsi == ' '
	jz good_arg_end_error
	cmp byte [rsi], 9			; if *rsi >= '\t'
	jz good_arg_end_error
	cmp byte [rsi], 10
	jz good_arg_end_error
	cmp byte [rsi], 11
	jz good_arg_end_error
	cmp byte [rsi], 12
	jz good_arg_end_error
	cmp byte [rsi], 13			; if *rsi <= '\r'
	jz good_arg_end_error

	mov rcx, rsi
	mov bl, byte [rsi]
good_arg_while2:
	inc rcx
	cmp byte [rcx], bl			; if *(rsi + 1) == *rsi
	jz good_arg_end_error
	cmp byte [rcx], 0			; if *(rsi + 1) != '\0'
	jnz good_arg_while2
	
	inc rsi						; rsi++
	cmp byte [rsi], 0			; if *rsi != '\0'
	jnz good_arg_while1

	mov rax, rcx 
	pop rsi
	sub rax, rsi
	ret

good_arg_end_error:
	pop rsi
	mov rax, 0 
	ret



_in_base:
	push rcx
	push rbx

	mov rax, -1
	xor rcx, rcx
	mov bl, [rdi]
while_in_base:
	cmp [rsi + rcx], byte 0
	jz while_in_base_end
	cmp bl, byte [rsi + rcx] 
	jz while_in_base_ret
	inc rcx
	jmp while_in_base

while_in_base_ret:
	mov rax, rcx
while_in_base_end:

	pop rbx
	pop rcx
	ret



;int	ft_atoi_base(char *, char *)
_ft_atoi_base:
	push rcx
	push rbx
	push r8

	cmp rdi, 0
	jz error_ft_atoi_base
	cmp byte [rdi], 0
	jz error_ft_atoi_base

	call _good_arg
	cmp rax, 0
	jz error_ft_atoi_base
	mov rbx, rax					; rbx = len of base

	push rdi
while_spaces:					; pass spaces
	cmp byte [rdi], 32				; if *rsi == ' '
	jz while_spaces_inc
	cmp byte [rdi], 9				; if *rsi >= '\t'
	jz while_spaces_inc
	cmp byte [rdi], 10
	jz while_spaces_inc
	cmp byte [rdi], 11
	jz while_spaces_inc
	cmp byte [rdi], 12
	jz while_spaces_inc
	cmp byte [rdi], 13				; if *rsi <= '\r'
	jz while_spaces_inc
	jmp while_spaces_end
	
while_spaces_inc:
	inc rdi
	jmp while_spaces
while_spaces_end:

	mov	rcx, 1
while_sign:							; pass and get sign
	cmp byte [rdi], 45				; if *rdi == '-'
	jz while_sign_neg
	cmp byte [rdi], 43				; if *rdi == '+'
	jz while_sign_inc
	jmp while_end

while_sign_neg:
	imul rcx, -1
while_sign_inc:
	inc	rdi
	jmp	while_sign
while_end:

	xor r8, r8
while_nb:
	call _in_base
	cmp rax, -1
	jz while_nb_end
	imul r8, rbx
	add r8, rax
	inc rdi
	jmp while_nb
while_nb_end:
	imul r8, rcx
	mov rax, r8

	pop rdi
	pop r8
	pop rbx
	pop rcx
	ret

error_ft_atoi_base:
	mov rax, 0
	pop r8
	pop rbx
	pop rcx
	ret
