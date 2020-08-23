%include 'src/include/functions.asm'

SECTION .data
msg1 db 'Hello', 0h
msg2 db 'World', 0h

SECTION .text
global _start

_start:

    mov eax, msg1
    call sprintLF

    mov eax, msg2
    call sprintLF

    call quit