global _ft_strlen

; size_t	ft_strlen(const char *s);
_ft_strlen:
	mov		rax, 0
loop:
	cmp 	byte [rdi + rax], 0
	je		end
	inc		rax
	jmp		loop
end:
	ret
