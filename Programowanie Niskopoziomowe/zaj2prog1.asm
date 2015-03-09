%include "asm64_io.inc"

segment .data
nie db "nie", 0
tak db "tak", 0

segment .text
global asm_main 
asm_main:
enter 0,0

call read_int

mov esi, 0x2
mov edi, eax

petla:

xor edx, edx
xor eax, eax

mov ebx, esi
add esi, 0x1
mov eax, edi

cmp eax, ebx
je koniecprogramuTak

div ebx
mov ecx, 0x0
cmp edx, ecx
je koniecprogramuNie

jmp petla

koniecprogramuTak:
mov rax, tak
call print_string
jmp koniec

koniecprogramuNie:
mov rax, nie
call print_string
jmp koniec

koniec:
mov rax, 0
leave
ret
