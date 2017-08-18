#include "Foo.h"

namespace myapp {

Foo::Foo(){}

Foo::Foo(int a, int b)
    : _a(a)
    , _b(b)
{}

int Foo::calc() {
    return this->_a + this->_b;
}

} // namespace myapp