#include <iostream>
using namespace std;

struct Coor
{
	int r;
	int c;
};

struct Psg
{
	int BSin;
	int BSout;
	Coor place;
	int joy;
};

struct PLACE
{
	int raqam;
	int qimat;
};

void In(PLACE** places, int rows, int cols, Psg& psg);
void Out(PLACE** places, int rows, int cols, Psg psg);

int main()
{
	int M;
	cin >> M; // bus-stops
	int N;
	cin >> N; // passengers
	
	Psg* psgs = new Psg [N];
	for (int i = 0; i < N; i++)
		cin >> psgs[i].BSin >> psgs[i].BSout;
	
	const int rows = 20;
	const int cols = 6;
	PLACE** places = new PLACE* [rows];
	int raqam = 1;
	for (int i = 0; i < rows; i++)
	{
		places[i] = new PLACE [cols];
		for (int j = 0; j < cols; j++)
		{
			places[i][j].qimat = 0;
			places[i][j].raqam = raqam++;
		}
	}
	
	for (int i = 1; i <= M; i++)
	{
		for (int j = 0; j < N; j++)
		{
			if (psgs[j].BSout == i)
				Out(places, rows, cols, psgs[j]);
		}
		for (int j = 0; j < N; j++)
		{
			if (psgs[j].BSin == i)
				In(places, rows, cols, psgs[j]);
		}
	}
	
	for (int i = 0; i < N; i++)
	{
		cout << "BSin: " << psgs[i].BSin << ";  BSout: "
			 << psgs[i].BSout << ";  row: "
			 << psgs[i].place.r << ";  cols: "
			 << psgs[i].place.c << ";  joy: "
			 << psgs[i].joy << endl;
	}
	
	for (int i = 0; i < rows; i++)
		delete [] places[i];
	delete [] places;
	delete [] psgs;
	places = NULL;
	psgs = NULL;
	
	return 0;
}

void In(PLACE** places, int rows, int cols, Psg& psg)
{
	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols/2; j++)
		{
			if (places[i][j].qimat == 0)
			{
				psg.place.r = i;
				psg.place.c = j;
				psg.joy = places[i][j].raqam;
				places[i][j].qimat = 1;
				return;
			}
		}
		for (int j = cols-1; j >= cols/2; j--)
		{
			if (places[i][j].qimat == 0)
			{
				psg.place.r = i;
				psg.place.c = j;
				psg.joy = places[i][j].raqam;
				places[i][j].qimat = 1;
				return;
			}
		}
	}
}

void Out(PLACE** places, int rows, int cols, Psg psg)
{
	places[ psg.place.r ][ psg.place.c ].qimat = 0;
}
