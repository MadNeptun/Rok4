BITS 32
section .text 
global _Z5zerujPij
global _Z6kopiujPiS_j
_Z5zerujPij:
enter 0,0
cld
mov eax, 0x0
mov ecx, [ebp+12]   
mov edi, [ebp+8]
rep stosd
leave
ret
_Z6kopiujPiS_j:
enter 0,0
cld
mov ecx, [ebp+16] 
mov esi, [ebp+12]   
mov edi, [ebp+8]
rep movsd
leave
ret