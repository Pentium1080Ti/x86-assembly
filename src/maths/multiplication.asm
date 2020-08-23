%include 'src/include/functions.asm'

SECTION .text
global _start

_start:

    mov eax, 10
    mov ebx, 10
    mul ebx
    call iprintLF

    call quit