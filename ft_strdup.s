; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:24:40 by sdunckel          #+#    #+#              ;
;    Updated: 2019/12/17 10:25:34 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	extern _malloc
	global _ft_strdup

; char *ft_strdup(const char *s1)
_ft_strdup:
	push	rdi
	call	ft_strlen
	inc		rax			; +1 for \0
	mov		rdi, rax	; put len in arg1 for malloc
	call	_malloc
	pop		rdi
	cmp		rax, 0
	je		end
	push	rsi
	mov		rsi, rdi
	mov 	rdi, rax
	call	ft_strcpy
end:
	pop		rsi
	ret

ft_strlen:
	xor		rax, rax					; i = 0
ft_strlen_loop:
	cmp 	byte [rdi + rax], 0		; while s[i] != NULL
	je		ft_strlen_end
	inc		rax						; i = i + 1;
	jmp		ft_strlen_loop
ft_strlen_end:
	ret								; return i

ft_strcpy:
	mov		rax, rdi
ft_strcpy_loop:
	mov		bl, [rsi]
	mov		[rdi], bl
	cmp		bl, 0
	je		ft_strcpy_end
	inc		rdi
	inc		rsi
	jne		ft_strcpy_loop
ft_strcpy_end:
	ret
