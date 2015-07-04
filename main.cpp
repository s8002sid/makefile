#include <iostream>
#include <vector>
#include "vector.h"
#include "my_string.h"
using namespace std;
//Adding hotfix 1
void hotfix_4()
{
    cout << "hotfix_4" << endl;
}
int main()
{
    my_vector::doSomething();
    my_string::do_something();
    hotfix_4();
}
