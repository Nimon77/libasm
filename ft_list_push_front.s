section .text
    global _ft_list_push_front

_ft_list_push_front:
    mov rcx, [rdi]
    mov 8[rsi], rcx
    mov [rdi], rsi
    ret