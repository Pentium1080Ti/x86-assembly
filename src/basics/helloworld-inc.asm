%include 'src/include/functions.asm'

SECTION .data
msg1 db 'Hello', 0Ah, 0h ; 0Ah needs be used when calling sprint instead of sprintLF
msg2 db 'World', 0Ah, 0h

SECTION .text
global _start

_start:

    mov eax, msg1
    call sprint

    mov eax, msg2
    call sprint

    call quit