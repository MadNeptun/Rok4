#include <stdio.h>

typedef struct{
    int min;
    int max;
} MM;

MM minmax( int N, ...);

int main(){
   int n = 0;
   int i = 0;
   scanf("%d", &n);
   int p = 0;
   int array[n];
   while(i<n)
   {
	scanf("%d", &p);
	array[i] = p;
	i++;
   }
   MM wynik = minmax(n, array);
   printf("min = %d, max = %d \n", wynik.min, wynik.max);
   return 0;
}