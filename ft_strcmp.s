; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:24:03 by sdunckel          #+#    #+#              ;
;    Updated: 2020/01/06 12:47:39 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strcmp

; int 		ft_strcmp(const char *s1, const char *s2);
_ft_strcmp:
	mov		r10, 0
	mov		rbx, 0
	mov		rax, 0
loop:
	mov 	al, byte[rdi + r10]	; mov both char in al and bl
	mov 	bl, byte[rsi + r10]
	cmp 	al, 0				; check if they are not /0, in case we stop cmp
	je		end
	cmp		bl, 0
	je		end
	inc		r10
	cmp		al, bl				; while they are equal we continue looping
	je		loop
end:
	sub		rax, rbx
	cmp		rax, 0
	je		equal
	jg		sup
	jl		inf
equal:
	mov		rax, 0
	ret
sup:
	mov		rax, 1
	ret
inf:
	mov		rax, -1
	ret
