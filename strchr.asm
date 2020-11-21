; input : RDI, RSI
; output : RAX

strchr:
    push rdi
    .loop:
        xor rax, rax
        mov rax, rsi
        cmp byte [rdi], al
        je .done
        cmp byte [rdi], 0
        je .done
        inc rdi
        jmp .loop

    .done:
        mov rax, rdi
        pop rdi
        ret
