#include "doctest.h"

#include "basic.h"

namespace example_test {

int factorial(int number) { return number <= 1 ? number : factorial(number - 1) * number; }

TEST_SUITE("exampleTest") {

TEST_CASE("testing the factorial function") {
    CHECK(factorial(1) == 1);
    CHECK(factorial(2) == 2);
    CHECK(factorial(3) == 6);
    CHECK(factorial(10) == 3628800);
}

} // exampleTest

} // namespace example_test