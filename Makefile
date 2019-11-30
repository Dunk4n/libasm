# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: niduches <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/26 08:50:51 by niduches          #+#    #+#              #
#    Updated: 2019/11/30 15:52:50 by niduches         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RM = rm -f
LIB = ar rcs

CC = gcc
CFLAGS = -Wall -Wextra

NASM = nasm
NASMFLAGS = -f macho64 #elf64

SRC =	ft_strlen.s				\
		ft_strcpy.s				\
		ft_strcmp.s				\
		ft_write.s				\
		ft_read.s				\
		ft_strdup.s				\

SRCB =	ft_atoi_base.s			\
		ft_list_push_front.s	\
		ft_list_size.s			\
		ft_list_sort.s			\
		ft_list_remove_if.s		\

NAME = libasm.a

OBJ = $(SRC:.s=.o)
OBJB = $(SRCB:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(LIB) $(NAME) $(OBJ)

bonus: all $(OBJB)
	$(LIB) $(NAME) $(OBJ)

%.o: %.s
	$(NASM) $(NASMFLAGS) -o $@ $<

clean:
	$(RM) $(OBJ)
	$(RM) $(OBJB)

fclean: clean
	$(RM) $(NAME)

re: fclean all
