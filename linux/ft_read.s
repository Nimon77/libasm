section .text
    global  ft_read
    extern  __errno_location

ft_read:
    mov rax, 0x0
    syscall
    jc  error
    ret

error:
    mov r8, rax
    call __errno_location
    mov [rax], r8
    mov rax, -1
    ret