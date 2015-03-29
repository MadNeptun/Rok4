%include "asm64_io.inc"

segment .data
tablica dd 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0

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
je add_loop
mov [tablica + 4*edi], eax
inc edi
cmp edi, 0xA
jne read_loop

add_loop:
sub edi, 0x1
mov eax, [tablica + 4*edi]
sub eax, 0x20
call println_char
cmp edi, 0x0
jne add_loop

koniec:
mov rax, 0
leave
ret