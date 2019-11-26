# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: niduches <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/26 08:58:39 by niduches          #+#    #+#              #
#    Updated: 2019/11/26 18:10:46 by niduches         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_strlen

; int ft_strlen(char *);
_ft_strlen:
	push rcx
	xor rcx, rcx

strlen_next:
	cmp [rdi + rcx], byte 0
	jz strlen_end
	inc rcx
	jmp strlen_next

strlen_end:
	mov rax, rcx

	pop rcx
	ret