# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/22 11:56:06 by sdunckel          #+#    #+#              #
#    Updated: 2019/12/10 09:40:47 by sdunckel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libasm.a

SRCS		= \
				ft_write.s \
				ft_read.s \
				ft_strlen.s \
				ft_strcmp.s \
				ft_strdup.s \
				ft_strcpy.s

SRCS_BONUS		= \
				ft_list_size_bonus.s \
				ft_list_push_front_bonus.s \
				ft_list_sort_bonus.s

OBJS		= ${SRCS:.s=.o}
OBJS_BONUS	= ${SRCS_BONUS:.s=.o}

NA			= nasm
NA_FLAGS	= -f macho64

CC			= gcc
CFLAGS 		= -Wall -Wextra -Werror

RM			= rm -f

$(NAME):	${OBJS}
			@ar -rcs ${NAME} ${OBJS}

%.o: %.s
			@$(NA) $(NA_FLAGS) -o $@ $<

all:		${NAME}

bonus:		$(OBJS_BONUS) $(NAME)
			@ar -rcs ${NAME} ${OBJS} ${OBJS_BONUS}

test:		all
			@$(CC) $(CFLAGS) $(NAME) main.c -o test
			@./test

bonustest:	bonus
			@$(CC) $(CFLAGS) $(NAME) main_bonus.c -o test_bonus
			@./test_bonus

clean:
			@${RM} ${OBJS}
			@${RM} ${OBJS_BONUS}

fclean:		clean
			@${RM} ${NAME} test
			@${RM} ${NAME} test_bonus

re:			fclean all

.PHONY: 	all fclean clean re
