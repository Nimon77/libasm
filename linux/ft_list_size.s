section .text
    global ft_list_size

ft_list_size:
    mov rax, 0
counter:
    cmp rdi, 0
    jz  end
    mov rdi, [rdi + 8]
    inc rax
    jmp counter

end:
    ret