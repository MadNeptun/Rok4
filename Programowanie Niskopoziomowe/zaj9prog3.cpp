#include <iostream>
extern "C" int iloczyn (int n, int * tab);
int main()
{
	std::cout << iloczyn(4, 1, 2, 3, 4);
	return 0;
}