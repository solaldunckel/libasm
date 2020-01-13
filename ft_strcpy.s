; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:24:34 by sdunckel          #+#    #+#              ;
;    Updated: 2020/01/06 12:46:36 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strcpy

; char *ft_strcpy(char *dest, const char *src);
_ft_strcpy:
	mov		rax, rdi
loop:
	mov		bl, [rsi]	; src char in bl
	mov		[rdi], bl	; bl in dest
	cmp		bl, 0		; if we copied a /0 we stop
	je		end
	inc		rdi 		; inc both
	inc		rsi
	jmp		loop
end:
	ret
