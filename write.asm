; RDI = file descriptor | RSI = offset string | RDX = nbr de caracter
write:
    mov rax, 1
    syscall
    ret