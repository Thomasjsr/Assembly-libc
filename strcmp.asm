%include "putstr.asm"
%include "exit.asm"
segment .data

str1 db "Hello World", 0
str2 db "Hello world", 0

equal_msg db "the strings are eqaul", 0
greater_msg db "string 1 is greater then string 2", 0
less_msg db "string 1 less then string 2", 0

segment .text
global _start

; input : ESI = offset string 1, EDI = offset string 2
; output AL = diff of byte
strcmp:
    push rsi
    push rdi
    .loop:
        mov al, byte [esi]
        mov ah, byte [edi]
        cmp al, ah
        jne .not_equal
        cmp byte [esi], 0
        je .equal
        inc esi
        inc edi
        jmp .loop
    
    .done:
        pop rdi
        pop rsi
        ret

    .not_equal:
        sub al, ah
        jmp .done
    
    .equal:
        xor al, al
        jmp .done


equal:
    mov esi, equal_msg
    call putstr
    jmp exit

greater:
    mov esi, greater_msg
    call putstr
    jmp exit

less:
    mov esi, less_msg
    call putstr
    jmp exit


_start:
    mov esi, str1
    mov edi, str2
    call strcmp
    mov ebx, 0
    cmp al, 0
    je equal
    jl less
    jmp greater
    jmp exit