%include 'src/include/functions.asm'

SECTION .data
request db 'GET / HTTP/1.1', 0Dh, 0Ah, 'Host: 116.202.244.153:80', 0Dh, 0Ah, 0Dh, 0Ah, 0h

SECTION .bss
buffer resb 1               ; for response

SECTION .text
global _start

_start:

    xor eax, eax
    xor ebx, ebx
    xor edi, edi

_socket:

    push byte 6
    push byte 1
    push byte 2
    mov ecx, esp
    mov ebx, 1
    mov eax, 102
    int 80h

_connect:

    mov edi, eax
    push dword 0x99f4ca74   ; icanhazip.com hex (reversed - see reverse.c)
    push word 0x5000        ; port 80
    push word 2             ; AF_INET
    mov ecx, esp
    push byte 16            ; args len
    push ecx
    push edi
    mov ecx, esp
    mov ebx, 3              ; CONNECT
    mov eax, 102            ; sys_socketcall opcode
    int 80h

_write:
    
    mov edx, 45             ; bytes to write
    mov ecx, request
    mov ebx, edi
    mov eax, 4              ; sys_write opcode
    int 80h

_read:
    
    mov edx, 1              ; read 1 byte at a time
    mov ecx, buffer
    mov ebx, edi
    mov eax, 3              ; sys_read opcode
    int 80h

    cmp eax, 0              ; EoF
    jz _close

    mov eax, buffer
    call sprint
    jmp _read

_close:

    mov ebx, edi
    mov eax, 6              ; sys_close opcode
    int 80h

_exit:

    call quit