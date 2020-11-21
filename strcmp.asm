%include "strlen.asm"
%include "strncmp.asm"


; input : RDI = offset string 1, RSI = offset string 2
; output RAX = diff of byte
strcmp:
    call strlen
    mov rdx, rax
    call strncmp
    ret