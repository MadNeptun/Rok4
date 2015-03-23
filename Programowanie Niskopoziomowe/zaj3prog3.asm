%include "asm64_io.inc"

segment .data
lic dw 0x0

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
push rax
inc edi
cmp edi, 0x5
jne read_loop_1
call read_char

get_no_1_p:
xor ecx, ecx
xor esi, esi
mov eax, 0x1
get_no_1:
xor edx, edx
pop rbx
mov dl, bl
mov ebx, eax
mul edx
add ecx, eax
mov eax, ebx
mov ebx, 0xA
mul ebx
inc esi
cmp esi, edi
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
push rax
inc edi
cmp edi, 0x5
jne read_loop_2

get_no_2_p:

xor ecx, ecx
xor esi, esi
mov eax, 0x1
get_no_2:
xor edx, edx
pop rbx
mov dl, bl
mov ebx, eax
mul edx
add ecx, eax
mov eax, ebx
mov ebx, 0xA
mul ebx
inc esi
cmp esi, edi
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