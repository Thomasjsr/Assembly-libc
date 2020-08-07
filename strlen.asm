; input : ESI
; output : EAX
strlen:
    push rcx
    push rsi
    xor ecx, ecx

    .loop:
        cmp byte [esi], 0
        je .done
        inc esi
        inc ecx
        jmp .loop
    
    .done:
        mov eax, ecx
        pop rsi
        pop rcx
        ret