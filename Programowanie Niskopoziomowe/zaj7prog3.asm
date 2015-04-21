BITS 32
section .text 
global iloczyn_skalarny
iloczyn_skalarny:
%define N dword [ebp+8]
%define x dword [ebp+12]
%define y dword [ebp+16]
push ebp
mov ebp, esp
xor edx, edx
push ebx
mov ebx, x
mov ecx, y
loop:
fld tword [ebx]
fld tword [ecx]
fmulp st1
cmp edx, 0x0
je forward
faddp st1
forward:
inc edx
add ebx, 0xC
add ecx, 0xC
cmp edx, N
jne loop
fstsw ax
pop ebx
mov esp, ebp
pop ebp
ret