    n equ 12
section .data
    A   dd  3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8
    B   dd  2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4, 5

section .bss
    C resd 12

section .text
    global _start
    extern E_prnt
_start:
    push dword A
    mov eax, n
    push eax
    call E_prnt

    push dword B
    mov eax, n
    push eax
    call E_prnt

    mov ecx, n
    mov esi, A
    mov edi, B
    mov ebx, C
.sumLoop:
    mov eax, [esi]
    add eax, [edi]
    mov [ebx], eax
    add esi, 4
    add edi, 4
    add ebx, 4
    loop .sumLoop

    push dword C
    mov eax, n
    push eax
    call E_prnt

L_exit:
    mov eax, 1
    xor ebx, ebx
    int 80
