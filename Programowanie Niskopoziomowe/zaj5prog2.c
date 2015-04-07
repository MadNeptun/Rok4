#include <stdio.h>
int suma (int n, int* array);
int main()
{
	int n=0;
	scanf("%d", &n);
	int i=0;
	int p=0;
	int array[n];
	while(i<n)
	{
		scanf("%d", &p);
		array[i] = p;
		i++;
	}	
	printf("%d\n", suma(n, array));
	return 0;
}