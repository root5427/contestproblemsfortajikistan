#include <iostream>
#include <sstream>
using namespace std;

int main()
{
	ostringstream oss;
	const int maxn = 100, maxm = 100;

	int n;
	cin >> n;
	
	int points[maxn+1];
	for (int i = 1; i <= n; i++)
		cin >> points[i];
	
	int bonus, m;
	cin >> bonus >> m;
	
	for (int j = 1; j <= m; j++)
	{
		int maxx = 0;
		bool flag = true;
		int cur = 0;
		for (int i = 1; i <= n; i++)
		{
			int p;
			cin >> p;
			if (p == 0)
				flag = false;
			else
				cur = cur + points[i];
		}
		if (flag)
			cur = cur + bonus;
		cur = cur - 2*(j-1);
		if (cur > maxx)
			maxx = cur;
		oss << maxx << "\n";
	}
	
	cout << endl << oss.str();
	
	return 0;
}