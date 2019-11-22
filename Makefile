# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/22 11:56:06 by sdunckel          #+#    #+#              #
#    Updated: 2019/11/22 11:58:58 by sdunckel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libasm.a

SRCS_LIST	= \

SRCS		= $(addprefix ${FOLDER}/, ${SRCS_LIST})
OBJS		= ${SRCS:.s=.o}


NA			= nasm
NA_FLAGS	= -f macho64

CC			= gcc
CFLAGS 		= -Wall -Wextra -Werror

RM			= rm -f

$(NAME):	${OBJS}
			@ar -rcs ${NAME} ${OBJS}

%.o: %.s
			@${NA} -c ${NA_FLAGS} -o $@ $<

all:		${NAME}

clean:
			@${RM} ${OBJS}

fclean:		clean
			@${RM} ${NAME}

re:			fclean all

.PHONY: 	all fclean clean re
