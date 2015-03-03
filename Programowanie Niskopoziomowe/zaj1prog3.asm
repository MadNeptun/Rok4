SECTION .data
fileName db "./generowanyplik.txt", 0
fileContent db "piotr rachwal", 0
lenght equ $ - fileContent
SECTION .text
global      _start
  
_start:

mov eax, 8
mov ebx, fileName
mov ecx, 0x0700
int 80h

mov ebx, eax
mov eax, 4
mov ecx, fileContent
mov edx, lenght
int 0x80

mov EAX, 6
int 0x80

mov eax, 1
int 80h
