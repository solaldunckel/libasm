; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_atoi_base_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/16 14:47:11 by sdunckel          #+#    #+#              ;
;    Updated: 2020/01/06 14:01:04 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	extern _ft_strlen
	global _ft_atoi_base
;	int		ft_atoi_base(char *str, char *base)
		;	rdi = *str	rsi = *base
_ft_atoi_base:
	push	r12
	push	r13
	push	r14
	cmp		rdi, 0
	je		end
	cmp		rsi, 0
	je		end
	mov		r10, rdi	; save *str in r10
	mov		r11, rsi	; save *base in r11
	mov		rdi, rsi
	call	_ft_strlen
	mov		r12, rax	; r12 = strlen(base)
	cmp		r12, 0
	je		end
	cmp		r12, 1		; if base len = 1 = invalid base
	je		end
	push	r11
	call	check_base	; we check invalid char in base
	pop		r11
	cmp		rax, 0
	je		end
	mov		r13, 1 		; negative
	xor		r14, r14 	; convert result
	jmp		skip

convert:
	mov		bl, [r10]	; char to convert
	cmp		bl, 0
	je		end
	xor		r9, r9
	push	r11
	call	is_base		; rax is base index
	pop		r11
	cmp		rax, -1
	je		end
	imul	r14, r12	; mul with base len
	add		r14, rax	; add base index
	inc		r10
	jmp		convert

;;; check if char in str is from base, return index in base if found
is_base:
	cmp		bl, [r11]
	je		is_base_success
	mov		cl, [r11]
	cmp		cl, 0
	je		is_base_failure
	inc		r9
	inc		r11
	jmp		is_base
is_base_success:
	mov		rax, r9
	ret
is_base_failure:
	mov		rax, -1
	ret

;;; check base (len <= 1 / same char 2 times / base with whitespace + or -)
check_base:
	mov		bl, [r11]
	cmp		bl, 0				; means we checked the whole base
	je		check_base_success
	cmp		bl, 32				; check error for space + -
	jle		check_base_error
	cmp		bl, 43
	je		check_base_error
	cmp		bl, 45
	je		check_base_error
	push	r11
	inc		r11
	xor		r9, r9
	call	is_base				; we check if the char is not already in the base
	pop		r11
	cmp		rax, -1
	jne		check_base_error
	inc		r11
	jmp		check_base			; loop
check_base_error:
	mov		rax, 0
	ret
check_base_success:
	mov		rax, 1
	ret

;;; skip spaces
skip:
	mov		bl, [r10]
	cmp		bl, 9		; skip all spaces
	je		inc_skip
	cmp		bl, 10
	je		inc_skip
	cmp		bl, 11
	je		inc_skip
	cmp		bl, 12
	je		inc_skip
	cmp		bl, 13
	je		inc_skip
	cmp		bl, 32
	je		inc_skip
	jmp		sign
inc_skip:
	inc		r10
	jmp		skip

;;; check + and -
sign:
	mov		bl, [r10]	; skip signs and multiply by -1 for each -
	cmp		bl, 43
	je		inc_sign
	cmp		bl, 45
	je		minus
	mov		r13, rax
	jmp		convert
inc_sign:
	inc		r10
	jmp		sign
minus:
	inc		r10
	imul	rax, -1
	jmp		sign
end:
	mov		rax, r14
	imul	rax, r13
	pop		r14
	pop		r13
	pop		r12
	ret
