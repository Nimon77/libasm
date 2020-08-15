section .text
    global  ft_read
    extern  __errno_location

ft_read:
    mov rax, 0x0
    syscall
	cmp rax, 0
    js  error
    ret

error:
	neg rax
	push rax
    call __errno_location
	pop rcx
    mov [rax], rcx
    mov rax, -1
    ret
