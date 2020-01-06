; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:24:40 by sdunckel          #+#    #+#              ;
;    Updated: 2019/12/20 01:35:13 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy
	global _ft_strdup

; char *ft_strdup(const char *s1)
_ft_strdup:
	push	rdi
	call	_ft_strlen
	inc		rax			; +1 for \0
	mov		rdi, rax	; put len in arg1 for malloc
	call	_malloc
	cmp		rax, 0
	je		end
	pop		rdi
	mov		rsi, rdi
	mov 	rdi, rax
	call	_ft_strcpy
end:
	ret
