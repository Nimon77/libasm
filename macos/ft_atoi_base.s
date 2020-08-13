section .text
    global _ft_atoi_base
    extern _ft_strlen

; 1 = rdi = str
; 2 = rsi = base
; size_base = rbx
; value = rax
; neg = r10

_ft_atoi_base:
    push    rdi                     ; save str
    mov     rdi, rsi                ; move base to rdi
    call    _ft_strlen              ; calc size base
    mov     rbx, rax                ; save size_base as rbx
    mov     rsi, rdi                ; restore base to rsi
    pop     rdi                     ; get str
    cmp     rbx, 0
    je      end                     ; if size_base = 0
    mov     eax, 0                  ; rax = 0
    mov     r8, 0                   ; r8 = 0

check_base:
    mov     r11b, BYTE[rsi + r8]
    cmp     r11b, 0
    je      check_base_end
    cmp     r11b, 9
    je      end                     ; if base == '\t'
    cmp     r11b, 10
    je      end                     ; if base == '\n'
    cmp     r11b, 11
    je      end                     ; if base == '\v'
    cmp     r11b, 12
    je      end                     ; if base == '\f'
    cmp     r11b, 13
    je      end                     ; if base == '\r'
    cmp     r11b, 32
    je      end                     ; if base == ' '
    cmp     r11b, 43
    je      end                     ; if base == '+'
    cmp     r11b, 45
    je      end                     ; if base == '-'
    mov     r9, r8
check_double:
    add     r9, 1
    mov     r12b, BYTE[rsi + r9]
    cmp     r12b, 0
    je      check_base_next
    cmp     r12b, r11b
    je      end
    jmp     check_double
check_base_next:
    add     r8, 1
    jmp     check_base

check_base_end:
    mov     r8, 0
    mov     r10, 1
    mov     r11, 0

check_space:
    mov     r11b, BYTE[rdi + r8]    ; set r11b as str[r8]
    cmp     r11b, 9
    je      next_space              ; if base == '\t'
    cmp     r11b, 10
    je      next_space              ; if base == '\n'
    cmp     r11b, 11
    je      next_space              ; if base == '\v'
    cmp     r11b, 12
    je      next_space              ; if base == '\f'
    cmp     r11b, 13
    je      next_space              ; if base == '\r'
    cmp     r11b, 32
    je      next_space              ; if r11b == ' '
    jmp     check_sign
next_space:
    inc     r8
    jmp     check_space

next_sign:
    inc     r8
    mov     r11b, BYTE[rdi + r8]
check_sign:
    cmp     r11b, 43
    je      next_sign               ; if r11b == '+'
    cmp     r11b, 45
    jne     parse                   ; if r11b == '-'
    neg     r10b
    jmp     next_sign

to_find:
    cmp     BYTE[rsi + r9], 0       ; rsi[r9] == '\0' ?
    je      is_neg                  ; yes
    cmp     r11b, BYTE[rsi + r9]    ; r11b == rsi[r9] ?
    je      finded                  ; yes
    inc     r9                      ; r9++
    jne     to_find                 ; no
finded:
    imul    eax, ebx                ; rax *= rbx
    add     eax, r9d                ; rax += r9
    inc     r8                      ; r8++

parse:
    mov     r9, 0                   ; r9 = 0
    mov     r11b, BYTE[rdi + r8]    ; set r11b as str[r8]
    cmp     r11b, 0                 ; r11b == '\0' ?
    jne     to_find                 ; no
is_neg:
    cmp     r10b, 1
    je      end
    neg     eax                     ; make eax neg

end:
    ret
