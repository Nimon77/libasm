section .text
    global ft_list_sort

; rdx = int(*cmp)

ft_list_sort:
    cmp     rdi, 0
    jz      end
    mov     rcx, [rdi]
    cmp     rcx, 0
    jz      end
    mov     rdx, rsi
    cmp     rdx, 0
    jz      end
    push    rcx        ; *begin_list
while:
    mov     rdi, [rcx] ; rdi = lst->content
    mov     r9, [rcx + 8] ; r9 = lst->next
    cmp     r9, 0
    jz      pre_end
    mov     rsi, [r9]  ; rsi = lst->next->content
    push    r9
    push    rcx
    push    rdx
    call    rdx
    pop     rdx
    pop     rcx
    pop     r9
    cmp     eax, 0
    jg      swap
    mov     rcx, r9
    jmp     while
swap:
    mov     [rcx], rsi
    mov     [r9], rdi
    pop     rcx
    push    rcx
    jmp     while

pre_end:
    pop     rax
    mov     rax, 0
end:
    ret