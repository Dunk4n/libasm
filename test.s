segment	.data
longIntFormat	db	"%ld ", 0
stringFormat	db	"%s", 0
newLine			db	10, 0
a				dq	7, 5, 2, 18, 14, 8

segment	.text
	extern _printf
	global _test

; int test(void);
_test:
; save pile pointer
	push rbp
	mov rbp, rsp
	push 12

for1:
	mov rcx, 0
	jmp test1

; rbx contient a[rcx]
next1:
	lea rsi, [rel a]
	mov rbx, [rsi+8*rcx]
	mov rdx, rcx
;	push rcx
	inc rdx

if1:
	lea rsi, [rel a]
	cmp rbx, [rsi+8*rdx]
	jng endif1
; valeur min dans rbx
	lea rsi, [rel a]
	mov rbx, [rsi+8*rdx]
; sauvegard de indice min sur pile
	push rdx

endif1:
	inc rdx

test2:
	cmp rdx, 6
	jl if1
; min dans rbx, exchange
	lea rsi, [rel a]
	mov rax, [rsi+8*rcx]
	mov [rsi+8*rcx], rbx
	pop rdx
	lea rsi, [rel a]
	mov [rsi+8*rdx], rax
	inc rcx

test1:
	cmp rcx, 5
	jl next1

; affichage du tableau
	mov r12, 0
	jmp test3

next3:
	mov rdi, longIntFormat
	lea rsi, [rel a]
	mov rsi, [rsi+8*r12]
	mov rax, 0
	call _printf
	inc r12

test3:
	cmp r12, 6
	jl next3
	mov rdi, stringFormat
	mov rsi, newLine
	mov rax, 0
	call _printf
; restauration pointeur pile
	pop r12
	mov rsp, rbp
	pop rbp

	mov rax, 0
	ret
