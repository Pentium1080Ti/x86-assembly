%include 'src/include/functions.asm'

SECTION .data
filename db 'readme.md', 0h
contents db '# ASMFTW', 0h

SECTION .text
global _start

_start:

    mov ecx, 0777       ; r, w, x
    mov ebx, filename
    mov eax, 8          ; sys_creat opcode
    int 80h

    mov edx, 8          ; bytes to write
    mov ecx, contents
    mov ebx, eax
    mov eax, 4          ; sys_write opcode
    int 80h

    call quit