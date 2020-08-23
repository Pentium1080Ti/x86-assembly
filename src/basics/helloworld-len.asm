SECTION .data
msg db 'Hello world! :)',0Ah

SECTION .text
global _start

_start:

    mov ebx,msg ; move msg into ebx
    mov eax,ebx ; move address in ebx to eax

nextchar:
    cmp byte [eax],0 ; compare byte against 0
    jz finished ; if 0 jmp to finished
    inc eax
    jmp nextchar

finished:
    sub eax,ebx ; subtract addr in ebx from eax - eax++ 1 byte for each char in str
                ; sub gives the number of segments between then when subtracting addresses - no. of bytes
    
    mov edx,eax
    mov ecx,msg
    mov ebx,1
    mov eax,4
    int 80h

    mov ebx,0
    mov eax,1
    int 80h