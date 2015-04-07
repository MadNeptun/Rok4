#include <stdio.h>
#include <stdlib.h>
int sortuj (int *a, int *b, int *c);
int main()
{
	int p;
	int *a, *b, *c;
	
	a = (int*)malloc(sizeof(int));
	b = (int*)malloc(sizeof(int));
	c = (int*)malloc(sizeof(int));

	scanf("%d %d %d", a, b, c);
	sortuj(a,b,c);

	p = *a;
	printf("%d\n", p);
	p = *b;
	printf("%d\n", p);
	p = *c;
	printf("%d\n", p);
	
	free(a);
	free(b);
	free(c);
	
	return 0;
}