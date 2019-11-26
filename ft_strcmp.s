global _ft_strcmp

;int 		ft_strcmp(const char *s1, const char *s2);
_ft_strcmp:
loop:
	mov		r10b, [rdi]		; store arg1 in r10
	mov		r11b, [rsi]		; store arg1 in r10
	cmp		r11b, r10b
	jne		diff
	cmp 	r10b, 0
	je		diff
	cmp 	r11b, 0
	je		diff
	add		rdi, 1
	add		rsi, 1
	jmp		loop

diff:
	movzx rax, r10b
	movzx rbx, r11b
	sub rax, rbx
	ret
