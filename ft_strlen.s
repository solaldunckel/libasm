; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:24:46 by sdunckel          #+#    #+#              ;
;    Updated: 2019/12/20 01:33:17 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strlen

; size_t	ft_strlen(const char *s);
_ft_strlen:
	mov		rax, 0					; i = 0
loop:
	cmp 	byte [rdi + rax], 0		; while s[i] != NULL
	je		end
	inc		rax						; i = i + 1;
	jmp		loop
end:
	ret								; return i
