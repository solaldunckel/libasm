; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_remove_if_bonus.s                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 07:43:18 by sdunckel          #+#    #+#              ;
;    Updated: 2019/12/17 10:26:15 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	extern _free
	global _ft_list_remove_if
; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
		; rdi = **begin_list / rsi = *data_ref / rdx = (*cmp) / rcx = (*free_fct)

_ft_list_remove_if:
	mov		rdi, [rdi]
push:
	cmp		rdi, 0
	je		end
	call	rdx
	cmp		rax, 0
	je		end
	;mov		[rdi], r13
	mov		rdi, [rdi + 8]
	jmp		push
end:
	ret
