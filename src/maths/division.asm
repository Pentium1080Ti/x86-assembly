%include 'src/include/functions.asm'

SECTION .data
remainder db ' remainder '

SECTION .text
global _start

_start:

    mov eax, 100
    mov ebx, 10
    div ebx
    call iprint
    mov eax, remainder
    call sprint
    mov eax, edx        ; move remainder
    call iprintLF

    call quit