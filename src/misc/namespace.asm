%include 'src/include/functions.asm'

SECTION .data
msg1 db 'Jumping to finished label', 0h
msg2 db 'Inside subroutine: ', 0h
msg3 db 'Inside subroutine "finished"', 0h

SECTION .text
global _start

_start:

subroutineOne:
    mov eax, msg1
    call sprintLF
    jmp .finished

; "." is a local label
.finished:
    mov eax, msg2
    call sprint
    mov eax, 1
    call iprintLF

subroutineTwo:
    mov eax, msg1
    call sprintLF
    jmp .finished

.finished:
    mov eax, msg2
    call sprint
    mov eax, 2
    call iprintLF

    mov eax, msg1
    call sprintLF
    
    call quit