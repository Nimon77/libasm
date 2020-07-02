section .text
    global _ft_strcpy

_ft_strcpy:
    mov rax, 0
    cmp rsi, 0
    jz  done
    jmp cpy

cpy:
    mov dl, BYTE [rsi + rax]
    mov BYTE [rdi + rax], dl
    cmp BYTE [rsi + rax], 0
    je  done
    inc rax
    jmp cpy

done:
    mov rax, rdi
    ret
