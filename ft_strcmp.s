section .text
	global _ft_strcmp

_ft_strcmp:
	mov		r10, rsi		; store arg1 in r10
	cmp		rdi, r10		; look for \0
	repne scasb				; search byte in al in rdi / increment rdi after each cmp
	sub		rdi, rsi		; save the string length
	dec		rdi				; decrement rdi
	mov		rax, rdi		; save rdi in rax for return
	ret						; return
