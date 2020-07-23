section .text
    global _ft_list_sort

swap:

_ft_list_sort:
    mov     rcx, rdi
    mov     rdx, rsi
    mov     r8, 0
while1:
    mov     r9, 0
while2:
    mov     rdi, [rcx]
    mov     r10, 8[rcx]
    mov     rsi, [r10]
    call    rdx
    cmp     rax, 0
    jne     swap
