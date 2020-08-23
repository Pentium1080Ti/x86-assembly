%include 'src/include/functions.asm'

SECTION .data
msg1 db 'Please enter your name: ', 0h
msg2 db 'Hello, ', 0h

SECTION .bss
sinput: resb 255

SECTION .text
global _start

_start:

    mov eax, msg1
    call sprint

    mov edx, 255    ; read 255 bytes
    mov ecx, sinput ; buffer for input
    mov ebx, 0      ; write to STDIN
    mov eax, 3      ; invoke sys_read - opcode 3
    int 80h

    mov eax, msg2
    call sprint

    mov eax, sinput ; move buffer to eax (input already has a line feed)
    call sprint

    call quit