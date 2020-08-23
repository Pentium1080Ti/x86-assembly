%include 'src/include/functions.asm'

SECTION .data
childmsg db 'child', 0h
parentmsg db 'parent', 0h

SECTION .text
global _start

_start:

    mov eax, 2
    int 80h

    cmp eax, 2
    jz child

parent:
    mov eax, parentmsg
    call sprintLF

    call quit

child:
    mov eax, childmsg
    call sprintLF

    call quit