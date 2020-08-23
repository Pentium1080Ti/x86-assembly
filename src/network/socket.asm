%include 'src/include/functions.asm'

SECTION .data
listening db 'listening on port 9001', 0h
response db 'HTTP/1.1 200 OK', 0Dh, 0Ah, 'Content-Type: text/html', 0Dh, 0Ah, 'Content-Length: 16', 0Dh, 0Ah, 0Dh, 0Ah, 'Hello World :)', 0Dh, 0Ah, 0h

SECTION .bss
buffer resb 255             ; place to store headers

SECTION .text
global _start

_start:

    xor eax, eax            ; init 0
    xor ebx, ebx
    xor edi, edi
    xor esi, esi

_socket:

    push byte 6             ; push 6 to stack - IPPROTO_TCP
    push byte 1             ; push 1 to stack - SOCK_STREAM
    push byte 2             ; push 2 to stack - PF_INET
    mov ecx, esp
    mov ebx, 1              ; subroutine SOCKET - 1
    mov eax, 102            ; sys_socketcall opcode
    int 80h

_bind:

    mov edi, eax            ; move ret of sys_socketcall into edi (file descriptor or -1 on error)
    push dword 0x00000000   ; 0.0.0.0
    push word 0x2923        ; port 9001 dec (reversed bytes)
    push word 2             ; AF_INET
    mov ecx, esp
    push byte 16            ; push 16 dec onto stack (args len)
    push ecx
    push edi
    mov ecx, esp
    mov ebx, 2              ; BIND
    mov eax, 102            ; sys_socketcall
    int 80h
    
    mov eax, listening
    call sprintLF

_listen:

    push byte 1             ; max queue len arg
    push edi                ; file descriptor onto stack
    mov ecx, esp
    mov ebx, 4              ; LISTEN
    mov eax, 102            ; sys_socketcall
    int 80h

_accept:

    push byte 0             ; address len arg
    push byte 0             ; address arg
    push edi                ; file descriptor onto stack
    mov ecx, esp
    mov ebx, 5              ; ACCEPT
    mov eax, 102            ; sys_socketcall
    int 80h

_fork:

    mov esi, eax
    mov eax, 2              ; sys_fork opcode
    int 80h

    cmp eax, 0              ; if 0 we are child
    jz _read                ; child jumps to _read

    jmp _accept             ; parent jumps to _accept

_read:

    mov edx, 255            ; bytes to read (only first 255 for simplicity)
    mov ecx, buffer         ; move addr of buffer to ecx
    mov ebx, esi            ; move accepted file descriptor
    mov eax, 3              ; sys_read opcode
    int 80h

    mov eax, buffer
    call sprintLF

_write:

    mov edx, 80             ; bytes to write
    mov ecx, response
    mov ebx, esi
    mov eax, 4              ; sys_write opcode
    int 80h

_close:

    mov ebx, esi
    mov eax, 6              ; sys_close opcode
    int 80h

_exit:

    call quit