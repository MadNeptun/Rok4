%include "asm64_io.inc"

segment .data

segment .text
global asm_main 
asm_main:
enter 0,0

call read_int

mov esi, 0x1
mov edi, eax

petla:

xor edx, edx
xor eax, eax

mov ebx, esi
mov eax, edi

div ebx
cmp edx, 0x0
mov eax, ebx
je wypisz_liczba
koniec_f:

cmp edi, esi
je koniec

add esi, 0x1
jmp petla

wypisz_liczba:
call println_int
jmp koniec_f

koniec:
mov rax, 0
leave
ret
