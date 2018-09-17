#include <iostream>
#include <cstring>
using namespace std;

const int Nmax = 101;
void go(int pole[][Nmax+1], int paint[][Nmax+1], int* s, int x, int y, int N, int M, int num);

int main()
{
	int pole[Nmax+1][Nmax+1];
	int paint[Nmax+1][Nmax+1];
	int s[Nmax*Nmax+1];
	int n, m;
	int answer, num;
	
	memset(pole, char(63), (Nmax+1)*(Nmax+1)*sizeof(int));
	
	cin >> n >> m;
	for (int i = 1; i <= n; i++)
		for (int j = 1; j <= m; j++)
			cin >> pole[i][j];
	
	memset(paint, 0, (Nmax+1)*(Nmax+1)*sizeof(int));
	memset(s, 0, (Nmax*Nmax+1)*sizeof(int));
	
	answer = 0;
	num = 0;

	for (int i = 1; i <= n; i++)
		for (int j = 1; j <= m; j++)
			if (paint[i][j] == 0)
			{
				num++;
				go(pole, paint, s, i, j, n, m, num);
			}

	for (int i = 1; i <= num; i++)
		if (s[i] == 0)
			answer++;
	
	cout << answer;
}

void go(int pole[][Nmax+1], int paint[][Nmax+1], int* s, int x, int y, int N, int M, int num)
{
	if (paint[x][y] != 0)
		return;
	paint[x][y] = num;

	if ( ((x-1) >= 1) && ((x-1) <= N) && (y >= 1) && (y <= M) )
	{
		if (pole[x-1][y] == pole[x][y])
			go(pole, paint, s, x-1, y, N, M, num);
		if (pole[x-1][y] < pole[x][y])
			s[num] = 1;
	}

	if ( ((x+1) >= 1) && ((x+1) <= N) && (y >= 1) && (y <= M) )
	{
		if (pole[x+1][y] == pole[x][y])
			go(pole, paint, s, x+1, y, N, M, num);
		if (pole[x+1][y] < pole[x][y])
			s[num] = 1;
	}

	if ( (x >= 1) && (x <= N) && ((y-1) >= 1) && ((y-1) <= M) )
	{
		if (pole[x][y-1] == pole[x][y])
			go(pole, paint, s, x, y-1, N, M, num);
		if (pole[x][y-1] < pole[x][y])
			s[num] = 1;
	}

	if ( (x >= 1) && (x <= N) && ((y+1) >= 1) && ((y+1) <= M) )
	{
		if (pole[x][y+1] == pole[x][y])
			go(pole, paint, s, x, y+1, N, M, num);
		if (pole[x][y+1] < pole[x][y])
			s[num] = 1;
	}
}