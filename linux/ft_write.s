section .text
	global ft_write
	extern __errno_location

ft_write:
	mov rax, 0x1
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
