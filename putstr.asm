;%include "strlen.asm"
%include "write.asm"

; input RDI
putstr:
    push rdx
    push rax
    push rcx
    push rbx

    mov rsi, rdi
    call strlen ; output : EAX = lenght of string

    mov rdx, rax    
    mov rdi, 1 ; file discriptor

    call write

    pop rbx
    pop rcx
    pop rax
    pop rdx
    ret