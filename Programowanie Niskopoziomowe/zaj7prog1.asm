BITS 32
section .text 
global wartosc
wartosc:
%define a qword [ebp+8]
%define b qword [ebp+16]
%define c qword [ebp+24]
%define d qword [ebp+32]
%define x qword [ebp+40]
push ebp
mov ebp, esp
fld a
fld x
fmulp st1
fld b
faddp st1
fld x
fmulp st1
fld c
faddp st1
fld x
fmulp st1
fld d
faddp st1
fstsw ax
mov esp, ebp
pop ebp
ret