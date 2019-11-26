global _ft_list_size

; int	ft_list_size(t_list *begin_list);
_ft_list_size:
	mov		rax, 0
loop:
	cmp 	rdi, 0
	je		end
	inc		rax
	mov		rdi, [rdi + 8]
	jmp		loop
end:
	ret
