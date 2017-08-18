#include "doctest.h"

#include "Foo.h"

namespace foo_test {

TEST_SUITE("fooTest") {

SCENARIO("calc bar from foo with 40 and 2") {
    GIVEN("foo with 40 and 2") {
        int a = 40;
        int b = 2;

        myapp::Foo foo (a, b);

        WHEN("calc bar") {
            auto bar = foo.calc();

            THEN("bar is 42") { CHECK(bar == 42); }
        }
    }
}

} // fooTest

} // namespace foo_test