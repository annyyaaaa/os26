     1                                  section .data
     2                                      constl equ 5
     3 00000000 07000000                    varl dd 7
     4                                  section .text
     5                                      global _start
     6                                  _start:
     7 00000000 B805000000                 mov   eax,   constl
     8 00000005 8B1D[00000000]             mov   ebx,   [varl]
     9 0000000B 01D8                       add   eax,   ebx
    10                                  L_exit:
    11 0000000D B801000000                 mov   eax,   1
    12 00000012 31DB                       xor   ebx,   ebx
    13 00000014 CD80                       int   80h  
