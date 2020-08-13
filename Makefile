# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nsimon <nsimon@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/29 19:20:22 by nsimon            #+#    #+#              #
#    Updated: 2020/06/29 19:53:57 by nsimon           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

UNAME_S := $(shell uname -s)

NAME = libasm.a

ifeq ($(UNAME_S),Linux)
	ASM_PATH = ./linux/
	NASMFLAGS = -f elf64
endif
ifeq ($(UNAME_S),Darwin)
	ASM_PATH = ./macos/
	NASMFLAGS = -f macho64
endif

ASM_NAME = ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s \
			ft_atoi_base.s \
			ft_list_push_front.s \
			ft_list_size.s \
			ft_list_sort.s

ASM = $(addprefix $(ASM_PATH),$(ASM_NAME))

OBJ_PATH = ./objs/

ASM_OBJ_NAME = $(ASM_NAME:.s=.o)

ASM_OBJ = $(addprefix $(OBJ_PATH), $(ASM_OBJ_NAME))

NASM = nasm $(NASMFLAGS)

all: $(NAME)

$(NAME): $(ASM_OBJ)
	@echo "\033[34mCreation of $(NAME) ...\033[0m"
	@ar rc $(NAME) $(ASM_OBJ)
	@ranlib $(NAME)
	@echo "\033[32m$(NAME) created\n\033[0m"

$(OBJ_PATH)%.o: $(ASM_PATH)%.s
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@$(NASM) -o $@ $<

clean:
	@echo "\033[33mRemoval of .o files of $(NAME) ...\033[0m"
	@rm -f $(ASM_OBJ)
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

.PHONY: all, clean, fclean, re, git
