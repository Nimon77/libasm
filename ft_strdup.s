section .text
    global _ft_strdup
    extern _ft_strlen
    extern _ft_strcpy
    extern _malloc

_ft_strdup:
    push    rdi         ; save char *src
    call    _ft_strlen  ; calc size
    mov     rdi, rax
    call    _malloc
    mov     rdi, rax    ; new char* (dst) to 1st argument
    pop     rsi         ; char *src as 2nd argument
    call    _ft_strcpy
    ret
