SECTION .data
licz1 db " "
licz2 db " "
licz3 db " "
licz4 db " "

SECTION .text
global      _start

_start:
mov eax, 3
mov ebx, 0
mov ecx, licz1
mov edx, 2
int 80h

mov eax, 3
mov ebx, 0
mov ecx, licz2
mov edx, 2
int 80h

mov ecx, [licz1]
mov ebx, [licz2]

sub cl, '0'
sub bl, '0'
add cl, bl

xor eax, eax
xor edx, edx
mov al, cl
mov ebx, 0x0A
div ebx

add eax, 0x30
add edx, 0x30

mov [licz3], eax
mov [licz4], edx
int 80h

mov eax, 4
mov ebx, 1
mov ecx, licz3
mov edx, 1
int 80h

mov eax, 4
mov ebx, 1
mov ecx, licz4
mov edx, 1
int 80h

mov eax, 1
int 80h
