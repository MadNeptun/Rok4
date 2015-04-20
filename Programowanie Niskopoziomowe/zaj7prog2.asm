BITS 32
section .text
global prostopadloscian
prostopadloscian:
%define a dword [ebp+8]
%define b dword [ebp+12]
%define c dword [ebp+16]
push ebp
mov ebp, esp
fld a
fld b
fmulp st1
fld c
fmulp st1
mov eax, [ebp+20]
fstp dword [eax]
fld a
fld b
faddp st1
fld c
fmulp st1
fld a
fld b
fmulp st1
fadd st1
fld1
fld1
faddp st1
fmulp st1
mov eax, [ebp+24]
fstp dword [eax]
mov esp, ebp
pop ebp
ret