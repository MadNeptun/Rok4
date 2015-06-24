BITS 64                                                        ;( 1)
                                                               ;( 2)
section .text                                                  ;( 3)
global wypelnij, _wypelnij, wymiana, _wymiana, szukaj, _szukaj ;( 4)
wypelnij:                                                      ;( 5) *** funkcja wypelnij start
_wypelnij:                                                     ;( 6)
    push rcx                                                   ;( 7)
    xor rax, rax                                               ;( 8)
    mov al, dil                                                ;( 9) This is enforced by changing (AH, BH, CH, DH) to (BPL, SPL, DIL, SIL) for instructions using a REX prefix. Cytat ze strony Intela
    mov rdx, 3                                                 ;(10) według wykładu DIL to 8 młodszych bitów rdi
    mov cl, 8                                                  ;(11)
.loop1:                                                        ;(12)
    mov r9, rax                                                ;(13)
    shl rax, cl                                                ;(14) przesunięcie bitów w lewo w eax o cl (puste miejsca wypełnione zerami)
    add rax, r9                                                ;(15)
    shl cl, 1                                                  ;(16) przesunięcie bitów w lewo w eax o 1 (puste miejsca wypełnione zerami)
    sub rdx, 1                                                 ;(17) 
    jnz .loop1                                                 ;(18) skok jeśli rdx nie równa się 0
    mov rcx, 2                                                 ;(19)
.loop2:                                                        ;(20)
    dec rcx                                                    ;(21) --
    mov [rsi + rcx * 8], rax                                   ;(22)
    jnz .loop2                                                 ;(23) skok jeśli rcx nie równa się 0
    pop rcx                                                    ;(24)
    ret                                                        ;(25) *** funkcja wypelnij koniec
                                                               ;(26)
szukaj:                                                        ;(27) *** funkcja szukaj start
_szukaj:                                                       ;(28)
    push rdi                                                   ;(29)
    xor  rax, rax                                              ;(30)
.search:                                                       ;(31)
    scasb                                                      ;(32) porównuje (ustawia flagi) bajt w AL z bajtem w EDI (zakładam że najstarszym inaczej nie miało by to sensu) i następnie zwiększa EDI o 1
    jne  .search                                               ;(33) wyjście z funkcji jeśli równe
jeśli nierówne powtórz
    dec  rdi                                                   ;(34) --
    mov  rax, rdi                                              ;(35)
    pop  rdi                                                   ;(36)
    sub  rax, rdi                                              ;(37)
    and  rax, -16                                              ;(38) logiczne and na bitach wynik do rax
    ret                                                        ;(39) 
                                                               ;(40) *** funkcja szukaj koniec
wymiana:                                                       ;(41)
_wymiana:                                                      ;(42) *** funkcja wymiana start
    push rbp                                                   ;(43)
    mov  rbp, rsp                                              ;(44)
    shl rcx, 8                                                 ;(45) przesunięcie bitów w lewo w eax o 8 (puste miejsca wypełnione zerami)
    mov cl, dl                                                 ;(46)
    shl rcx, 8                                                 ;(47) przesunięcie bitów w lewo w eax o 8 (puste miejsca wypełnione zerami)
    mov cl, sil                                                ;(48) This is enforced by changing (AH, BH, CH, DH) to (BPL, SPL, DIL, SIL) for instructions using a REX prefix. Cytat ze strony Intela
    push rcx                                                   ;(49)
    and  rsp, 0xfffffffffffffff0                               ;(50) logiczne and na bitach wynik do rsp
    sub  rsp, 64                                               ;(51)
    push rdi                                                   ;(52)
                                                               ;(53)
    mov  rcx, 3                                                ;(54)
    lea  rsi, [rsp+8]                                          ;(55) oblicz adres i załaduj go do pamięci
.loop1:                                                        ;(56)
    mov  dil, [rbp+rcx-9]                                      ;(57) This is enforced by changing (AH, BH, CH, DH) to (BPL, SPL, DIL, SIL) for instructions using a REX prefix. Cytat ze strony Intela
    call wypelnij                                              ;(58) wywołaj funkcję wypełnij
    add  rsi, 16                                               ;(59)
    loop .loop1                                                ;(60)
                                                               ;(61)
    mov  rdi, [rsp]                                            ;(62)
    call szukaj                                                ;(63) wywołaj funkcję szukaj
    pop  rdi                                                   ;(64)
    mov  rsi, rdi                                              ;(65)
    add  rdi, rax                                              ;(66)
                                                               ;(67)
.loop2:                                                        ;(68) strona: http://x86.renejeschke.de/
    cmp rsi, rdi                                               ;(69) zawiera opis zestawu instrukcji w tym sse
    jge .koniec                                                ;(70) zakończ wywołanie (jeśli większe bądź równe)
    movdqu xmm1, [rsi]                                         ;(71) przesuwa niewyrównane zmiennoprzecinkowe 32 bity do xmm1
    movdqa xmm2, xmm1                                          ;(72) przesuwa wyrównane zmiennoprzecinkowe 32 bity do xmm2
    movdqu xmm4, [rsp]                                         ;(73) j.w.
    movdqu xmm0, [rsp +32]                                     ;(74) j.w.
    pcmpgtb xmm0, xmm1                                         ;(75) Compare packed signed byte integers http://x86.renejeschke.de/html/file_module_x86_id_235.html
    paddb  xmm1, [rsp+16]                                      ;(76) Add packed byte integers http://x86.renejeschke.de/html/file_module_x86_id_226.html
    pand xmm4, xmm0                                            ;(77) operacja and na bitach wynik do xmm4
    pandn xmm0, xmm1                                           ;(78) negacja bitowa xmm0 a potem bitowe and wynik do xmm0
    por xmm4, xmm0                                             ;(79) bitowe or wynik do xmm4
    movdqu [rsi], xmm4                                         ;(80) j.w.
    add rsi, 16                                                ;(81)
    jmp .loop2                                                 ;(82)
.koniec:                                                       ;(83)
    mov rsp,rbp                                                ;(84) wyjście z funkcji
    pop rbp                                                    ;(85)
    ret                                                        ;(86) *** funkcja wymiana koniec

