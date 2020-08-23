%include 'src/include/functions.asm'

SECTION .data
cmd db '/bin/ls', 0h
arg1 db '-l', 0h
args dd cmd
    dd arg1
    dd 0h
env dd 0h

SECTION .text
global _start

_start:

    mov edx, env
    mov ecx, args
    mov ebx, cmd
    mov eax, 11     ; opcode for sys_execve
    int 80h

    call quit