#include <iostream>
#include "myLib.h"

int main(void)
{
    std::cout << "Hello CPack " << std::endl;

    MyLib lib;
    std::cout << lib.getMessage() << std::endl;
}