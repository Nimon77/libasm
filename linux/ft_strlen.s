section .text
	global  ft_strlen
		
ft_strlen:
	mov	rax, 0
	jmp	check
check:
	cmp	BYTE [rdi + rax], 0
	je	done
	inc	rax
	jmp	check
done:
	ret
