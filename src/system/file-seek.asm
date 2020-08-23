%include 'src/include/functions.asm'

SECTION .data
filename db 'readme.md', 0h
contents db 'an updated readme', 0h

SECTION .text
global _start

_start:

    mov ecx, 1          ; w only
    mov ebx, filename
    mov eax, 5
    int 80h

    mov edx, 2
    mov ecx, 0          ; set cursor pos to 0
    mov ebx, eax,       ; move open file descriptor to ebx
    mov eax, 19         ; sys_lseek opcode
    int 80h

    mov edx, 17
    mov ecx, contents
    mov ebx, ebx
    mov eax, 4
    int 80h

    call quit