%include "asm64_io.inc"

segment .data
liczba dd 0x0

segment .text
global asm_main 
asm_main:
enter 0,0

call read_int
mov [liczba], rax
call read_int
mov rdi, rax

mov rsi, [liczba]

petla:

xor rdx, rdx
mov rax, rsi
div rdi
cmp rdx, 0x0
je koniec

add rsi, [liczba]

jmp petla

koniec:
mov rax, rsi
call println_int
mov rax, 0
leave
ret
