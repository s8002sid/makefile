#include <iostream>
#include<string>
using namespace std;
namespace my_string
{
    void do_something()
    {
        string s1 = "This is a string";
        string my_name="Siddharth";
        cout << "Size is same as length, size: " << s1.size() << " length: " << s1.length() << endl;
        cout << "My name is " + my_name << endl;
        for ( char c: my_name )
        {
            cout << c;
        }
        cout << endl;
    }
}
