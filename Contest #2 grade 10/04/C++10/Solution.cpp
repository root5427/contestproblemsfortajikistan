#include <iostream>
#include <cstring>
using namespace std;

typedef long int integer;

const int maxsize = 4500;

short field[3][maxsize+2];
long int level[maxsize+2];
long int n, m, k;
long int i, j, ll;
long int x, y, t, d;
long int cur, next, prev;
long int ncell, nangle;
long int vm;

void readstrip()
{
	if (k > 0)
		cin >> t >> x >> y >> d;
	else
	{
		x = n+1;
		y = m+1;
		k = 0;
	}
	k--;
}

void calc()
{
	for (int i = 1; i <= m; i++)
		if (field[cur][i] == 1)
		{
			ncell++;
			if (field[prev][i-1] == 0)
				nangle += 1-field[prev][i] - field[cur][i-1];
			if (field[prev][i+1] == 0)
				nangle += 1-field[prev][i] - field[cur][i+1];
			if (field[next][i-1] == 0)
				nangle += 1-field[next][i] - field[cur][i-1];
			if (field[next][i+1] == 0)
				nangle += 1-field[next][i] - field[cur][i+1];
		}
}


int main()
{
	cin >> vm;
	cin >> n >> m >> k;
	
	readstrip();
	
	memset(field, 0, sizeof(short)*(maxsize+2));
	memset(level, 0, sizeof(long)*(maxsize+2));
	ll = 0;
	i = 1;
	j = 1;
	ncell = 0;
	nangle = 0;
	prev = 0;
	cur = 1;
	next = 2;
	while (i <= n)
	{
		if ((x == i) && (y == j))
		{
			if (t == 1)
			{
				if (level[j] < i+d)
					level[j] = i+d;
			}
			else if (ll < j+d)
				ll = j+d;
			readstrip();
		}

		if ((j < ll) || (i < level[j]))
			field[next][j] = 0;
		else
			field[next][j] = 1;
		j++;
		if (j > m)
		{
			calc();
			if (i == 25)
				j = 1;
			j = 1;
			ll = 0;
			i++;
			prev = cur;
			cur = next;
			next = (next+1) % 3;
		}
	}
	
	memset(field[next], 0, sizeof(short)*(maxsize+2));
	calc();
	if (vm == 1)
		cout << ncell << endl;
	else
		cout << nangle / 4 << endl;
	
	return 0;
}