#include <iostream>
#include <iomanip>
using namespace std;

int CharToInt(char C);

int main()
{
	long int hh, mm, ss, h, m, s;
	char C;
	cin >> hh >> C >> mm >> C >> ss;
	
	char time[100];
	cin >> time;
	int length = 0, dunuqtaho = 0;
	for (int i = 0; time[i] != '\0'; i++)
	{
		length++;
		if (time[i] == ':')
			dunuqtaho++;
	}
	
	h = m = s = 0;
	int index;
	switch (dunuqtaho)
	{
		case 0:
			for (index = 0; index < length; index++)
				s = s * 10 + CharToInt(time[index]);
			break;
		case 1:
			index = 0;
			for (; index < length; index++)
			{
				if (time[index] == ':')
				{
					index++;
					break;
				}
				m = m * 10 + CharToInt(time[index]);
			}
			for (; index < length; index++)
				s = s * 10 + CharToInt(time[index]);
			break;
		case 2:
			index = 0;
			for (; index < length; index++)
			{
				if (time[index] == ':')
				{
					index++;
					break;
				}
				h = h * 10 + CharToInt(time[index]);
			}
			for (; index < length; index++)
			{
				if (time[index] == ':')
				{
					index++;
					break;
				}
				m = m * 10 + CharToInt(time[index]);
			}
			for (; index < length; index++)
				s = s * 10 + CharToInt(time[index]);
			break;
	}
	
	long int newH(h), newM(m), newS(s);
	
	long int days;
	newS += ss;
	days = newS / 60;
	newS %= 60;
	
	newM += days;
	newM += mm;
	days = newM / 60;
	newM %= 60;
	
	newH += days;
	newH += hh;
	days = newH / 24;
	newH %= 24;
	
	cout.fill('0');
	cout << setw(2) << newH << ":" << setw(2) << newM << ":" << setw(2) << newS;
	
	if (days > 0)
		cout << "+" << days << " days";
	
	return 0;
}

int CharToInt(char C)
{
	int farq = int(C) - int('0');
	
	if ( (farq > 9) || (farq < 0) )
		return -1;
	
	return farq;
}