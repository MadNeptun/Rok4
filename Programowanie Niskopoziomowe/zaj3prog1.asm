%include "asm64_io.inc"

segment .data
tablica dd 0x0, 0x0, 0x0, 0x0, 0x0

segment .text
global asm_main 
asm_main:
enter 0,0

xor edi, edi

read_loop:
call read_int
mov [tablica + 4*edi], eax
inc edi
cmp edi, 0x5
jne read_loop

xor esi, esi
xor edi, edi

add_loop:
mov ebx, [tablica + 4*edi]
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