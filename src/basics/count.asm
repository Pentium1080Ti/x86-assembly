; 10 will be printed as a colon as it has an ASCII value of 58 - corrected in count-ascii.asm
%include 'src/include/functions.asm'

SECTION .text
global _start

_start:

    mov ecx, 0

nextNumber:
    inc ecx

    mov eax, ecx
    add eax, 48     ; convert to ascii by adding 48
    push eax
    mov eax, esp    ; get addr of char on stack
    call sprintLF

    pop eax         ; clean stack
    cmp ecx, 10     ; stop when ecx is 10
    jne nextNumber  ; continue if not equal

    call quit