; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_sort_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/11 16:22:47 by sdunckel          #+#    #+#              ;
;    Updated: 2019/12/17 10:25:59 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_list_sort

; void	ft_list_sort(t_list **begin_list, int (*cmp)());
_ft_list_sort:
	push	r12				; save r12
	push	r13				; save r13
	cmp		rsi, 0 			; if arg2 == NULL
	je		end				; 	return
	mov		r11, [rdi] 		; r11 = *begin
	cmp 	r11, 0 			; if *begin == NULL
	je		end				;	return
	mov		r12, rsi		; r12 = int (*cmp)
	mov		r13, [r11 + 8]	; tmp = begin->next
	jmp		loop
loop:
	cmp		r13, 0			; if tmp == NULL
	je		inc				; 	begin = begin->next
	mov		rdi, [r11]		; rdi = begin->data
	mov		rsi, [r13]		; rsi = tmp->data
	call	r12				; *cmp(rdi, rsi);
	cmp		rax, 0			; if ret > 0
	jg		swap			; swap
	jmp		inc2			; tmp = tmp->next
inc:
	mov		r11, [r11 + 8]	; begin = begin->next
	cmp		r11, 0			; if begin == NULL
	je		end				;	return
	mov		r13, [r11 + 8]	; tmp = begin->next
	jmp		loop
inc2:
	mov		r13, [r13 + 8]	; tmp = tmp->next
	jmp		loop
swap:
	mov		r8, [r11]
	mov		r9, [r13]
	mov		[r11], r9
	mov		[r13], r8
	jmp		inc2
end:
	pop		r13				; restore r13
	pop		r12				; restore r12
	ret

; void		*ft_sort_list(t_list **lst, int (*cmp)(int, int))
; {
; 	t_list		*begin;
; 	t_list		*ptr;
; 	int			temp;
;
; 	temp = 0;
; 	begin = lst;
; 	while (lst)
; 	{
; 		ptr = lst->next;
; 		while (ptr)
; 		{
; 			if ((*cmp)(ptr->data, lst->data))
; 			{
; 				temp = lst->data;
; 				lst->data = ptr->data;
; 				ptr->data = temp;
; 			}
; 			ptr = ptr->next;
; 		}
; 		lst = lst->next;
; 	}
; 	return (begin);
; }
