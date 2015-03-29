%include "asm64_io.inc"

segment .data
lic dd 0x0
stack db 0x0, 0x0, 0x0, 0x0, 0x0

segment .text
global asm_main 
asm_main:
enter 0,0

xor edi, edi
read_loop_1:
call read_char
cmp al, 0x0A
je get_no_1_p
sub eax, 0x30
mov [stack + edi], al
inc edi
cmp edi, 0x5
jne read_loop_1
call read_char

get_no_1_p:
xor ecx, ecx
mov eax, 0x1
get_no_1:
sub edi, 0x1
xor edx, edx
mov bl, [stack + edi]
mov dl, bl
mov ebx, eax
mul edx
add ecx, eax
mov eax, ebx
mov ebx, 0xA
mul ebx
cmp edi, 0x0
jne get_no_1

mov [lic], ecx

xor ebx, ebx
xor eax, eax
xor ecx, ecx
xor edx, edx
xor edi, edi

read_loop_2:
call read_char
cmp al, 0x0A
je get_no_2_p
sub eax, 0x30
mov [stack + edi], al
inc edi
cmp edi, 0x5
jne read_loop_2

get_no_2_p:

xor ecx, ecx
xor esi, esi
mov eax, 0x1
get_no_2:
xor edx, edx
sub edi, 0x1
mov bl, [stack + edi]
mov dl, bl
mov ebx, eax
mul edx
add ecx, eax
mov eax, ebx
mov ebx, 0xA
mul ebx
inc esi
cmp edi, 0x0
jne get_no_2

wypisz:
xor eax, eax
add ecx, [lic]
mov eax, ecx
call println_int

koniec:
mov rax, 0
leave
ret