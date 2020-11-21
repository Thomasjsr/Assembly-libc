; input : RDI = offset string 1, RSI = offset string 2, RDX = nbr of char to compare
; output RAX = diff of byte
strncmp:
    push rdi
    push rsi
    xor rcx, rcx
    .loop:
        cmp rcx, rdx
        je .equal
        mov al, byte [rdi]
        mov ah, byte [rsi]
        cmp al, ah
        jne .not_equal
        cmp byte [rdi], 0
        je .equal
        inc rdi
        inc rsi
        inc rcx
        jmp .loop
    
    .done:
        ;movzx rax, al
        pop rsi
        pop rdi
        ret

    .not_equal:
        movzx rax, byte [rdi]
        movzx rdx, byte [rsi]
        sub rax, rdx
        jmp .done
    
    .equal:
        xor rax, rax
        jmp .done

