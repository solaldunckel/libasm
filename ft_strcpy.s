; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:24:34 by sdunckel          #+#    #+#              ;
;    Updated: 2019/12/17 10:24:07 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strcpy

; char *ft_strcpy(char *dest, const char *src);
_ft_strcpy:
	mov		rax, rdi
loop:
	mov		bl, [rsi]
	mov		[rdi], bl
	cmp		bl, 0
	je		end
	inc		rdi
	inc		rsi
	jne		loop
end:
	ret
