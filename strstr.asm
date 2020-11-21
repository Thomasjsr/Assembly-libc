%include "strncmp.asm"
%include "putstr.asm"
%include "strlen.asm"

segment .data

s1 db 'Hello world', 0
s2 db 'orl', 0
null db 'null', 0
done db 'done', 0
	
segment .text
global _start

strstr:
    push rdi

    mov rdi, rsi
    call strlen
    mov rdx, rax

    pop rdi

    .loop:
        mov al, byte [rdi]

        cmp al, 0
        je .null

        cmp al, byte [rsi]
        je .compare_to_needle

        inc rdi

        jmp .loop

    .compare_to_needle:

        call strncmp

        cmp rax, 0
        je .done

        inc rdi

        jmp .loop

    .null:
        ;; print 'null'
        push rdi
	push rsi
	push rdx
	mov rdi, null
	call putstr
	pop rdx
	pop rsi
	pop rdi
        ;; print 'null'

        xor rax, rax
        ret

    .done:
        ;; print 'done'
        push rdi
	push rsi
	push rdx
	mov rdi, done
	call putstr
	pop rdx
	pop rsi
	pop rdi
        ;; print 'done'

        mov rax, rdi
        ret

; input : RDI, return value
exit:
    mov rdx, rdi
    mov rax, 60
    syscall

_start:
    mov rdi, s1
    mov rsi, s2	
    call strstr
    mov rdi, rax
    mov rdi, 0
    jmp exit	
