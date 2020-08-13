section .text
    global  _ft_list_push_front
    extern  _malloc

_ft_list_push_front:
    push    rdi
    push    rsi
    mov     rdi, 16
    call    _malloc
    pop     rsi
    pop     rdi
    mov     [rax], rsi
    mov     rcx, [rdi]
    mov     [rax + 8], rcx
    mov     [rdi], rax
    ret