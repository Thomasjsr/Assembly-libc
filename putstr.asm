%include "strlen.asm"
%include "write.asm"
; input ESI
putstr:
    push rdx
    push rax
    push rcx
    push rbx

    call strlen ; output : EAX = lenght of string

    mov edx, eax
    mov ecx, esi
    mov ebx, 1 ; file discriptor

    call write

    pop rbx
    pop rcx
    pop rax
    pop rdx
    ret
