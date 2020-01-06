; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:24:03 by sdunckel          #+#    #+#              ;
;    Updated: 2019/12/20 01:36:36 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strcmp

; int 		ft_strcmp(const char *s1, const char *s2);
_ft_strcmp:
	xor		r10, r10
	xor		rbx, rbx
	xor		rax, rax
loop:
	mov 	al, byte[rdi + r10]
	mov 	bl, byte[rsi + r10]
	cmp 	al, 0
	je		end
	cmp		bl, 0
	je		end
	inc		r10
	cmp		al, bl
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
