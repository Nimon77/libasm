section .text
    global _ft_strcmp

_ft_strcmp:
    mov rax, 0
    jmp comp

incre:
    cmp BYTE [rsi + rax], 0
    je done
    cmp BYTE [rdi + rax], 0
    je done
    inc rax

comp:
    mov dl, BYTE [rsi + rax]
    cmp BYTE [rdi + rax], dl
    je  incre

done:
    mov dl, BYTE [rdi + rax]
    mov bl, BYTE [rsi + rax]
    sub rdx, rbx
    mov rax, rdx
    ret