section .text 
global wartosc
wartosc:
mulsd xmm0, xmm2
addsd xmm0, xmm1
ret