%include "asm64_io.inc"

segment .data
tablica dw 0x0, 0x0, 0x0, 0x0, 0x0

segment .text
global asm_main 
asm_main:
enter 0,0

xor edi, edi

read_loop:
call read_int
mov esi, eax
xor eax, eax
mov eax, edi
mov ecx, 4
mul ecx
add eax, tablica
mov [eax], esi
inc edi
cmp edi, 0x5
jne read_loop

xor esi, esi
xor edi, edi

add_loop:
mov eax, edi
mov ecx, 4
mul ecx
add eax, tablica
mov ebx, [eax]
add esi, ebx
inc edi
cmp edi, 0x5
jne add_loop

mov eax, esi
call println_int

koniec:
mov rax, 0
leave
ret