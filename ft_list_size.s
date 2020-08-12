section .text
    global _ft_list_size

_ft_list_size:
    mov rax, 0
counter:
    cmp rdi, 0
    jz  end
    mov rdi, 8[rdi]
    inc rax
    jmp counter

end:
    ret