%include 'src/include/functions.asm'

SECTION .data
filename db 'readme.md', 0h

SECTION .text
global _start

_start:

    mov ebx, filename
    mov eax, 10         ; sys_unlink opcode
    int 80h

    call quit