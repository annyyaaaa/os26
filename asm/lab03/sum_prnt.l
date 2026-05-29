     1                                  section .data
     2 00000000 030000000500000008-         A   dd  3, 5, 8, 2, 4, 5, 6, 3, 7
     2 00000009 000000020000000400-
     2 00000012 000005000000060000-
     2 0000001B 000300000007000000 
     3 00000024 020000000700000001-         B   dd  2, 7, 1, 5, 7, 6, 2, 2, 4
     3 0000002D 000000050000000700-
     3 00000036 000006000000020000-
     3 0000003F 000200000004000000 
     4                                      N equ 12
     5                                  section .bss
     6 00000000 <res 30h>                   C resd N
     7                                  extern E_prnt
     8                                  extern putchar
     9                                  section .text
    10                                      global _start
    11                                  _start:
    12 00000000 B90C000000                  mov ecx, N
    13 00000005 BE[00000000]                mov esi, A
    14                                  .printA:
    15 0000000A 51                          push ecx
    16 0000000B FF36                        push dword [esi]
    17 0000000D E8(00000000)                call E_prnt
    18 00000012 81C404000000                add esp, 4
    19 00000018 6820000000                  push dword 0x20
    20 0000001D E8(00000000)                call putchar
    21 00000022 81C404000000                add esp, 4
    22 00000028 81C604000000                add esi, 4
    23 0000002E 59                          pop ecx
    24 0000002F E2D9                        loop .printA
    25 00000031 680A000000                  push dword 0x0A
    26 00000036 E8(00000000)                call putchar
    27 0000003B 81C404000000                add esp, 4
    28                                  
    29 00000041 B90C000000                  mov ecx, N
    30 00000046 BE[24000000]                mov esi, B
    31                                  .printB:
    32 0000004B 51                          push ecx
    33 0000004C FF36                        push dword [esi]
    34 0000004E E8(00000000)                call E_prnt
    35 00000053 81C404000000                add esp, 4
    36 00000059 6820000000                  push dword 0x20
    37 0000005E E8(00000000)                call putchar
    38 00000063 81C404000000                add esp, 4
    39 00000069 81C604000000                add esi, 4
    40 0000006F 59                          pop ecx
    41 00000070 E2D9                        loop .printB
    42 00000072 680A000000                  push dword 0x0A
    43 00000077 E8(00000000)                call putchar
    44 0000007C 81C404000000                add esp, 4
    45                                  
    46 00000082 B90C000000                  mov ecx, N
    47 00000087 BE[00000000]                mov esi, A
    48 0000008C BF[24000000]                mov edi, B
    49 00000091 BB[00000000]                mov ebx, C
    50                                  .sumLoop:
    51 00000096 8B06                        mov eax, [esi]
    52 00000098 0307                        add eax, [edi]
    53 0000009A 8903                        mov [ebx], eax
    54 0000009C 81C604000000                add esi, 4
    55 000000A2 81C704000000                add edi, 4
    56 000000A8 E2EC                        loop .sumLoop
    57                                  
    58 000000AA B90C000000                  mov ecx, N
    59 000000AF BE[00000000]                mov esi, C
    60                                  .printC:
    61 000000B4 51                          push ecx
    62 000000B5 FF36                        push dword [esi]
    63 000000B7 E8(00000000)                call E_prnt
    64 000000BC 81C404000000                add esp, 4
    65 000000C2 6820000000                  push dword 0x20
    66 000000C7 E8(00000000)                call putchar
    67 000000CC 81C404000000                add esp, 4
    68 000000D2 81C604000000                add esi, 4
    69 000000D8 59                          pop ecx
    70 000000D9 E2D9                        loop .printC
    71 000000DB 680A000000                  push dword 0x0A
    72 000000E0 E8(00000000)                call putchar
    73 000000E5 81C404000000                add esp, 4
    74                                  
    75 000000EB B801000000                  mov eax, 1
    76 000000F0 31DB                        xor ebx, ebx
    77 000000F2 CD80                        int 0x80
