; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_size_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/13 05:25:07 by sdunckel          #+#    #+#              ;
;    Updated: 2020/01/06 12:50:12 by sdunckel         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_list_size

; int	ft_list_size(t_list *begin_list);
_ft_list_size:
	mov		rax, 0
loop:
	cmp 	rdi, 0	; if we reach end of list stop
	je		end
	inc		rax		; inc list count
	mov		rdi, [rdi + 8]	; mov to next
	jmp		loop
end:
	ret
