; input : ESI, AL
; output : EAX
strchr:
    push rsi
    .loop:
        cmp byte [esi], al
        je .done
        cmp byte [esi], 0
        je .done
        inc esi
        jmp .loop

    .done:
        mov eax, esi
        pop rsi
        ret