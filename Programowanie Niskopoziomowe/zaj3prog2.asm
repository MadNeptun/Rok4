%include "asm64_io.inc"

segment .data
tablica dw 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0

segment .text
global asm_main 
asm_main:
enter 0,0

xor edi, edi
place:
xor esi, esi

read_loop:
xor rax, rax
call read_char
cmp esi, 0x0
jne place
mov esi, 0x1
mov dl, 0x2A
cmp al, dl
je nowa_faza
mov ebx, eax
xor eax, eax
mov eax, edi
mov ecx, 4
mul ecx
add eax, tablica
mov [eax], ebx
inc edi
cmp edi, 0xA
jne read_loop

nowa_faza:
xor eax, eax
mov eax, edi
mov ecx, 4
mul ecx
add eax, tablica
xor esi, esi
mov ecx, eax

add_loop:
sub ecx, 4
mov eax, [ecx]
sub eax, 0x20
call println_char
cmp ecx, tablica
jne add_loop

koniec:
mov rax, 0
leave
ret