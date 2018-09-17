// Забавная игра
#include <iostream>
using namespace std;

int* Dec2Bin(int n, int& digits);
int Bin2Dec(int* binar, int n);
void Move2Left(int* binar, int n);

int main()
{
	int n;
	cin >> n;
	int digits;
	int* binar = Dec2Bin(n, digits);
	
	int temp, maximal = n;
	do
	{
		Move2Left(binar, digits);
		temp = Bin2Dec(binar, digits);
		if (temp > maximal)
			maximal = temp;
	}
	while (temp != n);
	
	cout << maximal;
	
	delete [] binar;
	binar = NULL;
	
	return 0;
}

int* Dec2Bin(int n, int& digits)
{
	digits = 0;
	int temp = n;
	while (temp >= 2)
	{
		digits++;
		temp /= 2;
	}
	digits++;
	int* binar = new int [digits];
	for (int i = 0; i < digits; i++)
	{
		binar[i] = n % 2;
		n /= 2;
	}
	return binar;
}

int Bin2Dec(int* binar, int n)
{
	int result = 0;
	int du = 1;
	for (int i = 0; i < n; i++)
	{
		result += du * binar[i];
		du *= 2;
	}
	return result;
}

void Move2Left(int* binar, int digits)
{
	int temp = binar[0];
	for (int i = 0; i < digits-1; i++)
		binar[i] = binar[i+1];
	binar[digits-1] = temp;
}
