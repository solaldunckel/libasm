section .text
	global _ft_strlen

_ft_strlen:
	mov		rsi, rdi		; store arg1 in rsi
	mov		al, 0			; look for \0
	repne scasb				; search byte in al in rdi / increment rdi after each cmp
	sub		rdi, rsi		; save the string length
	dec		rdi				; decrement rdi
	mov		rax, rdi		; save rdi in rax for return
	ret						; return
