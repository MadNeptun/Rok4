#include <stdio.h>               //( 1)
int fun(int * tab, int rozmiar); //( 2)
int main(){                      //( 3)
  const int rozmiar = 3;         //( 4)
  int tab[] = {1, 2, 3, 4, 5};   //( 5)
  int i = 0;                     //( 6) nic specjalnego
  int wynik = fun(tab, rozmiar); //( 7) wykonanie funkcji
  for(i=0; i<rozmiar; i++)       //( 8)
    printf("%d ", tab[i]);       //( 9) wypisanie danych z tablicy
  printf("\n%d\n", wynik);       //(10) wypisanie wyniku funkcji
}                                //(11)

// wynik
// 4 2 16
// 2
