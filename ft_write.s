; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:24:56 by sdunckel          #+#    #+#              ;
;    Updated: 2020/01/06 12:41:30 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_write

; ssize_t 	ft_write(int fd, const void *buf, size_t count);
_ft_write:
	mov		rax, 0x2000004	; store write syscall : 0x200000 + UNIX syscall #
	syscall					; call it
	jc		error
	ret						; return
error:
	mov		rax, -1
