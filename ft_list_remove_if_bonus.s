; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_remove_if_bonus.s                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 07:43:18 by sdunckel          #+#    #+#              ;
;    Updated: 2019/12/17 17:28:16 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	extern _free
	global _ft_list_remove_if
; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
		; rdi = **begin_list / rsi = *data_ref / rdx = (*cmp) / rcx = (*free_fct)

_ft_list_remove_if:
	push	r12
	push	r13
	push	r14
	push	r15

	mov		r12, rdi
	cmp		r12, 0
	je		end
	mov		r13, rsi
	cmp		r13, 0
	je		end
	mov		r14, rdx
	cmp		r14, 0
	je		end
	mov		r15, rcx
	cmp		r15, 0
	je		end

	mov		r11, [r12]
loop_before:
	cmp		r11, 0
	je		inter
	mov		rdi, [r11]
	mov		rsi, r13
	call	r14
	cmp		rax, 0
	je		remove_before
	jmp		inter
remove_before:
	mov		r11, [r11 + 8]
	mov		[r12], r11
	jmp		loop_before

inter:
	cmp		r11, 0
	je		end
	mov		r11, [r12]

loop_after:
	cmp		r11, 0
	je		end
	mov		r10, [r11 + 8]
	cmp		r10, 0
	je		end
	mov		rdi, [r10]
	mov		rsi, r13
	call	r14
	cmp		rax, 0
	je		remove_after
	mov		r11, r10
	jmp		loop_after
remove_after:
	mov		r10, [r10 + 8]
	mov		[r11 + 8], r10
	jmp		loop_after

end:
	pop		r15
	pop		r14
	pop		r13
	pop		r12
	ret
