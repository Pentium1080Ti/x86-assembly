%include 'src/include/functions.asm'

SECTION .text
global _start

_start:

    mov eax, 2
    mov ebx, 18
    add eax, ebx
    call iprintLF

    call quit