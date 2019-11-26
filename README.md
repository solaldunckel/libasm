# libasm

## Help

# Registers

```
RAX = return function's value
RDI = dest address for mov or cmp (arg1)
RSI = source address for mov or cmp (arg2)
RDX = 128 bits high value
R9 -> R15 = general register
```

# Instruction

```
; Save register
push	REG
pop		REG

; Set register value
mov		REG, VALUE	; DEST = VALUE

; Common operations
add		DEST, VALUE	; DEST = DEST + VALUE
sub		-			; DEST = DEST - VALUE
inc		REG			; REG++
dec		-			; REG--
and		DEST, REG	; DEST = DEST & REG
xor		-			; DEST = DEST ^ REG
xor		REG, REG	; = mov	REG, 0
mul		REG			; REG = REG * RAX
div		REG			; REG = REG / RAX

; Dereferenced value
		[REG]		; = *REG

; Compare
cmp		REG, VALUE	; Set flags used by jmp variants

; Label
label:
		jmp	label	; next jumps depends on compare flags from cmp
		je	-		; is equal
		jne	-		; is not equal
		jl	-		; < VALUE
		jle	-		; <= VALUE
		jz	-		; = 0
		jnz	-		; != 0
		jg	-		; > VALUE
		jge	-		; >= VALUE
```

## Ressources

* [syscalls macOS] (https://sigsegv.pl/osx-bsd-syscalls/)
* [asm 64 bits] (http://www.lacl.fr/tan/asm)
* [Say Hello to ASM] (https://0xax.github.io/asm_1/)
* [Assembly from scratch] (https://www.conradk.com/codebase/2017/06/06/x86-64-assembly-from-scratch/)
