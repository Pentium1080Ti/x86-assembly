%include 'src/include/functions.asm'

SECTION .data
filename db 'readme.md', 0h

SECTION .bss
fileContents resb 255

SECTION .text
global _start

_start:

    mov ecx, 0
    mov ebx, filename
    mov eax, 5
    int 80h

    mov edx, 8              ; bytes to read
    mov ecx, fileContents
    mov ebx, eax
    mov eax, 3              ; sys_read opcode
    int 80h

    mov eax, fileContents
    call sprintLF

    call quit