; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_size_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:25:07 by sdunckel          #+#    #+#              ;
;    Updated: 2019/12/17 10:25:39 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_list_size

; int	ft_list_size(t_list *begin_list);
_ft_list_size:
	push	rdi
	xor		rax, rax
loop:
	cmp 	rdi, 0
	je		end
	inc		rax
	mov		rdi, [rdi + 8]
	jmp		loop
end:
	pop		rdi
	ret
