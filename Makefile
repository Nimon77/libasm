# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nsimon <nsimon@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/29 19:20:22 by nsimon            #+#    #+#              #
#    Updated: 2020/06/29 19:20:22 by nsimon           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm

INC_PATH = ./includes/

SRC_PATH = ./

ASM_PATH = ./

SRC_NAME =	main.c

ASM_NAME = ft_strlen.s

SRC = $(addprefix $(SRC_PATH),$(SRC_NAME))

ASM = $(addprefix $(ASM_PATH),$(ASM_NAME))

OBJ_PATH = ./objs/

OBJ_NAME = $(SRC_NAME:.c=.o)

ASM_OBJ_NAME = $(ASM_NAME:.s=.obj)

OBJ = $(addprefix $(OBJ_PATH), $(OBJ_NAME))

ASM_OBJ = $(addprefix $(OBJ_PATH), $(ASM_OBJ_NAME))

CC = gcc $(CFLAGS)

CFLAGS = -Wall -Wextra -Werror

ASM_SRC = ft_strlen.s

NASM = nasm $(NASMFLAGS)

NASMFLAGS = -f win64 -M

all: $(NAME)

$(NAME): $(OBJ)
	@echo "\033[34mCreation of $(NAME) ...\033[0m"
	@$(CC) $(OBJ) -o$(NAME)
	@echo "\033[32m$(NAME) created\n\033[0m"

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@$(CC) -I$(INC_PATH) -o $@ -c $<

$(OBJ_PATH)%.o: $(SRC_PATH)%.s
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@$(NASM) -o $@

clean:
	@echo "\033[33mRemoval of .o files of $(NAME) ...\033[0m"
	@rm -f $(OBJ)
	@rmdir $(OBJ_PATH) 2> /dev/null || true
	@echo "\033[31mFiles .o deleted\n\033[0m"

fclean: clean
	@echo "\033[33mRemoval of $(NAME)...\033[0m"
	@rm -f $(NAME) $(TEMP)
	@echo "\033[31mBinary $(NAME) deleted\n\033[0m"

re: fclean all

git:
	@git add .
	@git commit -m "$(NAME)"
	@git push

norme:
	norminette $(SRC)
	norminette $(INC_PATH)*.h

.PHONY: all, clean, fclean, re, git, norme