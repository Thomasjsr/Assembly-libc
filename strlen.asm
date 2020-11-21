; input : rdi
; output : rax
strlen:
    push rcx
    push rdi
    xor rcx, rcx

    .loop:
        cmp byte [rdi], 0
        je .done
        inc rdi
        inc rcx
        jmp .loop
    
    .done:
        mov rax, rcx
        pop rdi
        pop rcx
        ret