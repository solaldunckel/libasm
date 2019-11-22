section .text
	global _ft_write

_ft_write:
	mov		rax, 0x2000004	; store write syscall : 0x200000 + UNIX syscall #
	syscall					; call it
	ret						; return
