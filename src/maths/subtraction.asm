%include 'src/include/functions.asm'

SECTION .text
global _start

_start:

    mov eax, 100
    mov ebx, 10
    sub eax, ebx
    call iprintLF

    call quit