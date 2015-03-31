%include "asm64_io.inc"
segment .text
global asm_main 
asm_main:
enter 0,0

call read_int
push rax

call konwertuj

pop rax
print_number:
pop rax
cmp rax, 0x0
je koniec
call print_char
jmp print_number

koniec:
mov rax, 0
leave
ret

konwertuj:
pop rsi
pop rdi
mov rbx, 0x0
push rbx
xor rax, rax
xor rbx, rbx
mov rax, rdi
mov rbx, 0x10

div_loop:
xor rdx, rdx
div rbx
add rdx, 0x30
cmp rdx, 0x3A
jl wpisz_do_stosu
add rdx, 0x7
wpisz_do_stosu:
push rdx
cmp rax, 0x0
jne div_loop

push rdi
jmp rsi





