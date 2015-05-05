#include <iostream>
extern "C" int iloczyn (int n, int * tab);
int main()
{
	int tab[] ={1, 2, 3, 4};
	std::cout << iloczyn(4,tab) << std::endl;
	return 0;
}