global _ft_write

; ssize_t 	ft_write(int fd, const void *buf, size_t count);
_ft_write:
	mov		rax, 0x2000004	; store write syscall : 0x200000 + UNIX syscall #
	syscall					; call it
	ret						; return
