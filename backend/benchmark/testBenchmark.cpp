#include <string>
#include <thread>
#include <chrono>

#include "benchpress/benchpress.hpp"

namespace test_benchmark {

BENCHMARK("example", [](benchpress::context* ctx) {
	for (size_t i = 0; i < ctx->num_iterations(); ++i) {
		std::string example;
        example += "Hello ";
        example += "World";
	}
})

BENCHMARK("parallel benchmark", [](benchpress::context* ctx) {
	ctx->run_parallel([](benchpress::parallel_context* pctx) {
		while (pctx->next()) {
            std::string example;
            example += "Hello ";
            example += "World";
		}
	}
})

} // namespace test_benchmark