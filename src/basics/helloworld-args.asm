%include 'src/include/functions.asm'

SECTION .text
global _start

_start:

    pop ecx

nextArg:
    cmp ecx, 0h     ; check if any args left
    jz noMoreArgs   ; if 0 - quit
    pop eax
    call sprintLF
    dec ecx         ; decrease args left by 1
    jmp nextArg

noMoreArgs:

    call quit