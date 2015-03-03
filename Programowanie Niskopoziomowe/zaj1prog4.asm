
SECTION .data
pt db ":"
temp1 db "0"
temp2 db "0"
temp3 db "0"
temp4 db "0"
temp5 db "0"
temp6 db "0"

SECTION     .text
global      _start
  
_start:
  mov eax, 13
  int 80h

  xor edx, edx
  mov ebx, 0x0A
  div ebx
  add edx, '0'
  mov [temp1], edx
  push temp1

  xor edx, edx
  mov ebx, 0x06
  div ebx
  add edx, '0'
  mov [temp2], edx
  push temp2

  xor edx, edx
  mov ebx, 0x0A
  div ebx
  add edx, '0'
  mov [temp3], edx
  push temp3

  xor edx, edx
  mov ebx, 0x06
  div ebx
  add edx, '0'
  mov [temp4], edx
  push temp4

  xor edx, edx
  mov ebx, 24
  div ebx
  mov eax, edx
  xor edx, edx
  mov ebx, 0x0A
  div ebx
  add eax, '0'
  add edx, '0'
  mov [temp5], edx
  mov [temp6], eax
  push temp5
  push temp6
  int 80h

  mov eax, 4
  mov ebx, 1
  pop ecx
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  pop ecx
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, pt
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  pop ecx
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  pop ecx
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, pt
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  pop ecx
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  pop ecx
  mov edx, 1
  int 80h

  mov eax, 1
  int 80h
