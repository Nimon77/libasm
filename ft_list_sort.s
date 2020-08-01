section .text
    global _ft_list_sort

; rdx = int(*cmp)

_ft_list_sort:
    mov     rcx, [rdi]
    mov     rdx, rsi
    push    rcx        ; *begin_list
while:
    mov     rdi, [rcx] ; rdi = lst->content
    mov     r9, 8[rcx] ; r9 = lst->next
    mov     rsi, [r9]  ; rsi = lst->next->content
    push    r9
    push    rcx
    push    rdx
    call    rdx
    pop     rdx
    pop     rcx
    pop     r9
    cmp     rax, 0
    je      swap
    mov     rcx, r9
    mov     r9, 8[rcx]
    cmp     r9, 0
    jne     while
    pop     rax
    mov     rax, 0
    ret
swap:
    mov     [rcx], rsi
    mov     [r9], rdi
    pop     rcx
    push    rcx
    jmp     while