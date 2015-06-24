 #include <stdio.h>                       //( 1)
int run(int level, int * max, ...);       //( 2)
int main(){                               //( 3)
  register int a = 1;                     //( 4)
  int max =0.0, wynik=0.0;                //( 5) nic specjalnego
  wynik = run(5, &max,2,6,4,-2,10,5,3,0)  //( 6) obliczenie wyniku
  printf("%d %d\n", wynik, max);          //( 7) wypisanie obliczenia i wybranej liczby
  wynik = run(3, &max,2,6,4,-2,10,0);     //( 8) obliczenie wyniku
  printf("%d\n", wynik);                  //( 9) wypisanie obliczenia
  printf("%d\n", a);                      //(10) zakładam że sprawdzenie czy coś się nie zmieniło w pamięci
}                                         //(11)

// wynik:
// 21 5
// 20
// 1
