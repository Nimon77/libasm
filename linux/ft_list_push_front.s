section .text
    global  ft_list_push_front
    extern  malloc

ft_list_push_front:
    push    rdi
    push    rsi
    mov     rdi, 16
    call    malloc
    pop     rsi
    pop     rdi
    mov     [rax], rsi
    mov     rcx, [rdi]
    mov     [rax + 8], rcx
    mov     [rdi], rax
    ret