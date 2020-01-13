; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:25:01 by sdunckel          #+#    #+#              ;
;    Updated: 2020/01/06 12:38:34 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_read

; ssize_t	ft_read(int fd, const char *buf, size_t count);
_ft_read:
	mov		rax, 0x2000003	; store read syscall : 0x200000 + UNIX syscall
	syscall					; call it
	jc   	error
	ret						; return
error:
	mov		rax, -1
	ret
