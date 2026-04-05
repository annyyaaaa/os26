section .data
    constl equ 5
    varl dd 7
section .text
    global _start
_start:
   mov   eax,   constl
   mov   ebx,   [varl]
   add   eax,   ebx
L_exit:
   mov   eax,   1
   xor   ebx,   ebx
   int   80h  
