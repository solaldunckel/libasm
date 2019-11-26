global _ft_strcpy

; char *ft_strcpy(char *dest, const char *src);
_ft_strcpy:
	push	rdi
loop:
	mov		r10b, byte [rsi]
	mov		byte [rdi], r10b
	cmp		byte [rsi], 0
	je		end
	add		rdi, 1
	add		rsi, 1
	jne		loop
end:
	pop		rdi
	mov		rax, rdi
	ret
