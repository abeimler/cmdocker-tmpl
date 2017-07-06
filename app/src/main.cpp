#include <iostream>

#include "basic.h" // from backend

#include "Foo.h"

int main() {
    int a = 40;
    int b = 2;

    myapp::Foo foo (a, b);

    auto bar = foo.calc();

    std::cout << "Hello World!" << '\n';
    std::cout << "Foo: " << bar << '\n';
    
    return 0;
}