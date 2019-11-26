extern _ft_strlen
extern _ft_strcpy
extern _malloc
global _ft_strdup

; char *ft_strdup(const char *s1)
_ft_strdup:
	push	rdi
	call	_ft_strlen
	inc		rax			; +1 for /0
	mov		rdi, rax	; put len in arg1 for malloc
	call	_malloc
	pop		rdi
	cmp		rax, 0
	je		error
	mov		rsi, rdi
	mov 	rdi, rax
	call	_ft_strcpy
	ret
error:
	ret
