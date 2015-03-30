%include "asm64_io.inc"
segment .bss
    input1 resd 1
    input2 resd 1

segment .text
global asm_main 
asm_main:
enter 0,0

mov ebx, input1
call get_int
mov ebx, input2
call get_int

mov eax, [input1]
mov ecx, [input2]
add eax, ecx
call print_int

koniec:
mov rax, 0
leave
ret

get_int:
call read_int
mov [ebx], eax
ret