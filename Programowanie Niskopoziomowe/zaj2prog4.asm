%include "asm64_io.inc"

segment .bss
liczb dw 0x0

segment .text
global asm_main 
asm_main:
enter 0,0

call read_int
mov [liczb], eax ; pierwsze wczytuje max

call read_int ; potem min

mov esi, 0x2
mov edi, eax
jmp petla

nowyKrok:
mov esi, 0x2
cmp edi, [liczb]
je koniec
add edi, 0x1

petla:

xor edx, edx
xor eax, eax

mov ebx, esi
add esi, 0x1
mov eax, edi

cmp eax, ebx
je wypiszliczb

div ebx
cmp edx, 0x0
je nowyKrok

jmp petla

wypiszliczb:
call println_int
jmp nowyKrok

koniec:
mov rax, 0
leave
ret
