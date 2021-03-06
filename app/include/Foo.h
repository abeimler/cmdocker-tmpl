#ifndef FOO_H
#define FOO_H

namespace myapp {

class Foo {
    private:
    int _a = 0;
    int _b = 0;

    public:
    Foo();
    Foo(int a, int b);

    Foo& with_a(int a) {
        this->_a = a;
        return *this;
    }

    Foo& with_b(int b) {
        this->_b = b;
        return *this;
    }

    int a() const { return this->_a; }
    int b() const { return this->_b; }

    int calc();
};

} // namespace myapp

#endif // FOO_H