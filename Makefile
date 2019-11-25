RM = rm -f
LIB = ar rcs

CC = gcc
CCFLAGS = -Wall -Wextra -fomit-frame-pointer

NASM = nasm
NASMFLAGS = -f elf64 #macho64

SRC = ft_strlen.s	\

NAME = libasm.a

OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(LIB) $(NAME) $(OBJ)

test: all
	$(CC) main.c $(NAME)

%.o: %.s
	$(NASM) $(NASMFLAGS) -o $@ $<

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all
