# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: niduches <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/26 18:07:49 by niduches          #+#    #+#              #
#    Updated: 2019/11/26 18:07:59 by niduches         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_strcpy

;char	*strcpy(char *, const char *)
_ft_strcpy:
	push rbx
	push rcx
	mov rbx, 0
	mov rcx, 0
strcpy_next:
	cmp [rsi + rcx], byte 0
	jz strcpy_end
	mov bl, [rsi + rcx]
	mov byte [rdi + rcx], bl
	inc rcx
	jmp strcpy_next

strcpy_end:
	mov byte [rdi + rcx], 0
	pop rcx
	pop rbx
	mov rax, rdi
	ret
