section .text
	global _ft_strcmp

_ft_strcmp:
	mov	rax, 0
	mov	r8, 0
	mov	r9, 0
	jmp	comp

incre:
	cmp	BYTE [rsi + rax], 0
	je	done
    cmp	BYTE [rdi + rax], 0
    je	done
    inc	rax

comp:
    mov	dl, BYTE [rsi + rax]
    cmp	BYTE [rdi + rax], dl
    je	incre

done:
    mov	r8b, BYTE [rdi + rax]
    mov	r9b, BYTE [rsi + rax]
    sub	r8, r9
    mov	rax, r8
    ret