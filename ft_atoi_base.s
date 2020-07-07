section .text
    global _ft_atoi_base
    extern _ft_strlen

; 1 = rdi = str
; 2 = rsi = base
; size_base = rbx
; value = rax

_ft_atoi_base:
    push    rdi                     ; save str
    mov     rdi, rsi                ; move base to rdi
    call    _ft_strlen              ; calc size base
    mov     rbx, rax                ; save size_base as rbx
    mov     rsi, rdi                ; restore base to rsi
    pop     rdi                     ; get str
    mov     rax, 0                  ; rax = 0
    mov     r8, 0                   ; r8 = 0
    jmp     parse

to_find:
    cmp     BYTE[rsi + r9], 0       ; rsi[r9] == '\0' ?
    je      end                     : yes
    cmp     r11b, BYTE[rsi + r9]    ; r11b == rsi[r9] ?
    je      finded                  ; yes
    inc     r9                      ; r9++
    jne     to_find                 ; no

finded:
    imul    rax, rbx                ; rax *= rbx
    add     rax, r9                 ; rax += r9
    inc     r8                      ; r8++
    
parse:
    mov     r9, 0                   ; r9 = 0
    mov     r11b, BYTE[rdi + r8]    ; set r11b as str[r8]
    cmp     r11b, 0                 ; r11b == '\0' ?
    jne     to_find                 ; no

end:
    ret
