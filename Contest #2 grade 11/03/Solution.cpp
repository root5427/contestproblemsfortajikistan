#include <iostream>
#include <vector>
using namespace std;
int main()
{
    int n;
    cin>>n;
    int* mass=new int [n];
    for (int i=0;i<n;i++)
        cin>>mass[i];
    vector <int> vec;
    int s=2,s1=0,ad=0;
    for (int j=n-1;j>=0;j--)
    {
        vec.push_back(j+1);
        for (int i=j;i>=0;)
        {
            vec.push_back(mass[i]);
            i=(mass[i]-1);
        }
        s1=vec.size();
        if (s1>s)
        {
            s=s1;
            ad=vec[0];
        }
        vec.clear();
    }
    delete [] mass;
    mass=NULL;
    cout<<ad;
    return 0;
}
