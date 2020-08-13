section .text
    global ft_strdup
    extern ft_strlen
    extern ft_strcpy
    extern malloc

ft_strdup:
    push    rdi         ; save char *src
    call    ft_strlen  ; calc size
    mov     rdi, rax
    call    malloc
    mov     rdi, rax    ; new char* (dst) to 1st argument
    pop     rsi         ; char *src as 2nd argument
    call    ft_strcpy
    ret
