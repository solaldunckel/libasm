global _ft_read

; ssize_t	ft_read(int fd, const char *buf, size_t count);
_ft_read:
	mov		rax, 0x2000003	; store read syscall : 0x200000 + UNIX syscall #
	syscall					; call it
	ret						; return
