SECTION .data
msg db 'Hello world :)',0Ah

SECTION .text
global _start

_start:

    mov eax,msg
    call strlen

    mov edx,eax     ; strlen moves result to eax
    mov ecx,msg
    mov ebx,1
    mov eax,4
    int 80h

    mov ebx,0
    mov eax,1
    int 80h

strlen:
    push ebx        ; push ebx value to stack
    mov ebx,eax     ; move addr in eax to ebx

nextchar:
    cmp byte [eax],0
    jz finished
    inc eax
    jmp nextchar

finished:
    sub eax,ebx
    pop ebx
    ret