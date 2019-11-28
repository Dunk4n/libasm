# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_lst_size.s                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: niduches <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/27 19:55:22 by niduches          #+#    #+#              #
#    Updated: 2019/11/28 09:41:02 by niduches         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_list_size

; int     ft_list_size(t_list *begin_list)
_ft_list_size:
	push rdi

	xor rax, rax
ft_list_size_while:
	cmp rdi, 0
	jz ft_list_size_end
	inc rax
	mov rdi, [rdi + 8]
	jmp ft_list_size_while

ft_list_size_end:
	pop rdi
	ret
