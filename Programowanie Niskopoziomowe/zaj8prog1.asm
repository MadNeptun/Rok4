BITS 32
section .text 
global _Z6rotatehi
global _Z6rotateji
_Z6rotateji:
mov eax, [esp+4]
mov cl, [esp+8]
rol eax, cl
ret
_Z6rotatehi:
mov eax, [esp+4]
mov cl, [esp+8]
rol al, cl
ret

