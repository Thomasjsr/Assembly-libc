%include "exit.asm"
%include "strcmp.asm"
%include "putstr.asm"
segment .data
msg db "HellO WORl··d", 0
segment .text
global _start

; input RDI
; output RAX
strlowercase:
    push rdi
    xor rbx, rbx
    .loop:
        mov al, byte[rdi + rbx]
        cmp al, 0
        je .done
        call to_lower
        mov byte [rdi + rbx], ah
        inc rbx
        jmp .loop


    .done:
        mov rax, rdi
        pop rdi
        ret

; input al
; output ah
to_lower:
        cmp al, 'A'
        jl .done
        cmp al, 'Z'
        jg .done
        add al, 32

        .done:
            mov ah, al
            ret

strcasecmp:
    push rdi
    push rsi
    call strlowercase
    mov rdi, rsi
    call strlowercase
    mov rsi, rax
    call strcmp
    pop rsi
    pop rdi
    ret

_start:
    mov rdi, msg
    call strlowercase
    mov rdi, rax
    call putstr
    mov rdi, 0
    jmp exit
