%include 'src/include/functions.asm'

SECTION .data
msg db 'secs since unix start: ', 0h

SECTION .text
global _start

_start:

    mov eax, msg
    call sprint

    mov eax, 13     ; opcode for sys_time
    int 80h

    call iprintLF

    call quit