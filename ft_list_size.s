section .text
    global _ft_list_size

_ft_list_size:
    mov rax, 1
counter:
    cmp BYTE[8+rdi], 0
    je  end
    add rax, 1
    mov rdi, 8[rdi]
    jmp counter

end:
    ret