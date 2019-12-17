; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_remove_if_bonus.s                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 07:43:18 by sdunckel          #+#    #+#              ;
;    Updated: 2019/12/17 17:02:29 by sdunckel         ###   ########.fr        ;
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
	push	rdi

	mov		r12, [rdi]
	mov		r13, rsi
loop_before:
	cmp		r12, 0
	je		end
	mov		rdi, [r12]
	mov		rsi, r13
	call	rdx
	cmp		rax, 0
	je		remove_before
	jmp		end
remove_before:
	mov		[r12], [r15 + 8]
	jmp		loop_before
end:
	pop		rdi
	pop		r15
	pop		r14
	pop		r13
	pop		r12
	ret
