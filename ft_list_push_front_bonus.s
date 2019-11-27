extern _malloc
global _ft_list_push_front

; void	ft_list_push_front(t_list **begin, void *new);
_ft_list_push_front:
	mov		r10, rdi ; save rdi (arg1)
	mov		r11, rsi ; save rsi (arg2)
	mov		rdi, 16 ; put len to malloc in rdi (arg1)
	call	_malloc
	cmp		rax, 0 ; malloc fail
 	je		end
	mov 	[rax], r11 ; move rsi (arg2) in arg1 = new->data = *new
	mov		rcx, [r10] ; *begin in rcx
	mov		[rax + 8], rcx ; move *begin in new->next
	mov		[r10], rax
end:
	ret
