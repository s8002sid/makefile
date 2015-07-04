#include <vector>
#include <iostream>
#include "vector.h"
using namespace std;
namespace my_vector
{
    void doSomething()
    {
        vector<int> v = {1,2,3,4,5,6,7,8,9};
        vector<int>::iterator vbegin, vend;
        int i = 0;

        vbegin = v.begin();
        vend = v.end();
        for ( auto it = vbegin; it < vend; it++ )
        {
            i++;
            cout << "vector[" << i << "] = " << *it << endl;
        }
    }
}
