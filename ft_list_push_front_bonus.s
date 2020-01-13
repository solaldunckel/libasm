; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_push_front_bonus.s                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:23:57 by sdunckel          #+#    #+#              ;
;    Updated: 2020/01/13 11:20:34 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	extern _malloc
	global _ft_list_push_front

; void	ft_list_push_front(t_list **begin, void *new);
_ft_list_push_front:
	push	rdi				; save begin
	push	rsi				; save data
	mov		rdi, 16			; put len to malloc in rdi (arg1) sizeof(t_list)
	call	_malloc
	pop		rsi
	pop		rdi
	cmp		rax, 0			; malloc fail
 	je		end
	mov 	[rax], rsi		; move rsi (arg2) in arg1 = new->data = *new
	mov		rcx, [rdi]		; *begin in rcx
	mov		[rax + 8], rcx	; move *begin in new->next
	mov		[rdi], rax		; put the malloc list on front
end:
	ret
