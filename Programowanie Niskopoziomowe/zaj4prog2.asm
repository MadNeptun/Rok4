%include "asm64_io.inc"
segment .data
licz dd 0x0

segment .text
global asm_main 
asm_main:
enter 0,0

call read_int

call print_my_int

koniec:
mov rax, 0
leave
ret

print_my_int:
xor edi, edi

loop_1:
xor rdx, rdx
mov rcx, 0xA
div rcx
push rdx
add edi, 0x1
cmp rax, 0x0
je loop_2
jmp loop_1

loop_2:
sub edi, 0x1
xor rax, rax
pop rax
add rax, 0x30
call print_char
cmp edi, 0x0
jne loop_2

ret