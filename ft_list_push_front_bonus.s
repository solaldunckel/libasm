global _ft_list_push_front

; void	ft_list_push_front(t_list **begin, t_list *new);
_ft_list_push_front:
	cmp 	rdi, 0
	je		end
	inc		rax
	mov		rdi, [rdi + 8]
	jmp		loop
end:
	ret
