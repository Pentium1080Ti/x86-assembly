; create, write to, open, read from and close the file

%include 'src/include/functions.asm'

SECTION .data
filename db 'readme.md', 0h
contents db '# ASM FTW', 0h

SECTION .bss
fileContents resb 255

SECTION .text
global _start

_start:

    mov ecx, 0777           ; create
    mov ebx, filename
    mov eax, 8
    int 80h

    mov edx, 9             ; write
    mov ecx, contents
    mov ebx, eax
    mov eax, 4
    int 80h

    mov ecx, 0              ; open
    mov ebx, filename
    mov eax, 5
    int 80h

    mov edx, 12             ; read
    mov ecx, fileContents
    mov ebx, eax
    mov eax, 3
    int 80h

    mov eax, fileContents
    call sprintLF

    mov ebx, ebx            ; sys_close takes a file descriptor from ebx
    mov eax, 6              ; sys_close opcode
    int 80h

    call quit