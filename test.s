section .data
	hello db "hello world"
	hello_len equ $-hello

section .text
    global _start
_start:
    mov     rax, 0x2000004
    mov     rdi, 1
    mov     rsi, hello
    mov     rdx, hello_len
    syscall
    mov    rax, 0x2000001
    mov    rdi, 0
    syscall
