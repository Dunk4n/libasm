# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: niduches <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/27 11:59:21 by niduches          #+#    #+#              #
#    Updated: 2019/11/30 16:17:35 by niduches         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_strcmp

;int	ft_strcmp(const char *, const char *)
_ft_strcmp:
ft_strcmp_loop:
	mov al, byte [rdi]
	cmp al, byte [rsi]
	jnz ft_strcmp_end
	cmp al, 0
	jz ft_strcmp_end
	inc rdi
	inc rsi
	jmp ft_strcmp_loop

ft_strcmp_end:
	sub al, byte [rsi]
	ret
