# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/22 11:56:06 by sdunckel          #+#    #+#              #
#    Updated: 2019/11/26 12:26:57 by sdunckel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libasm.a

SRCS		= \
				ft_write.s \
				ft_read.s \
				ft_strlen.s \
				ft_strcmp.s \
				ft_strcpy.s

OBJS		= ${SRCS:.s=.o}

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

test:		$(NAME)
			@$(CC) $(CFLAGS) $(NAME) main.c -o test

clean:
			@${RM} ${OBJS}

fclean:		clean
			@${RM} ${NAME} test

re:			fclean all

retest:		fclean test

.PHONY: 	all fclean clean re
