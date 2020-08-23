;------------------------------------------
; void iprint(Integer number)
; integer printing
iprint:
    push eax
    push ecx
    push edx
    push esi
    mov ecx, 0

divisionLoop:
    inc ecx         ; count each byte to print
    mov edx, 0
    mov esi, 10
    idiv esi        ; eax / esi
    add edx, 48     ; edx -> ascii - edx holds remainder of division
    push edx
    cmp eax, 0      ; if 0 then no more division can be done
    jnz divisionLoop

printLoop:
    dec ecx         ; count each byte added to stack
    mov eax, esp
    call sprint
    pop eax
    cmp ecx, 0      ; if not zero keep printing
    jnz printLoop

    pop esi         ; restore all values from stack and continue
    pop edx
    pop ecx
    pop eax
    ret

;------------------------------------------
; void iprintLF(Integer number)
; integer printing with line feed
iprintLF:
    call iprint

    push eax        ; push to stack to preserve value
    mov eax, 0Ah    ; add line feed
    push eax        ; push line feed to stack 
    mov eax, esp    ; move addr of stack pointer to eax for sprint
    call sprint
    pop eax         ; remove line feed
    pop eax         ; restore value of eax
    ret

;------------------------------------------
; int slen(String message)
; string length 
slen:
    push ebx
    mov ebx, eax

nextchar:
    cmp byte[eax], 0
    jz finished
    inc eax
    jmp nextchar

finished:
    sub eax, ebx
    pop ebx
    ret

;------------------------------------------
; void sprint(String message)
; print string
sprint:
    push edx
    push ecx
    push ebx
    push eax
    call slen

    mov edx, eax
    pop eax

    mov ecx, eax
    mov ebx, 1
    mov eax, 4
    int 80h

    pop ebx
    pop ecx
    pop edx
    ret

;------------------------------------------
; void sprintLF(String message)
; string printing with line feed
sprintLF:
    call sprint

    push eax
    mov eax, 0Ah    ; 0Ah is a line feed
    push eax        ; push to stack to get addr
    mov eax, esp
    call sprint
    pop eax
    pop eax
    ret    

;------------------------------------------
; void exit()
; exit and restore resources
quit:
    mov ebx,0
    mov eax,1
    int 80h
    ret