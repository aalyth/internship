
const lookup = {}
function fib(n) {
	if (n == 0) { return 0 }
	if (n <= 2) { return 1 }

	if (lookup[n] != undefined) {
		return lookup[n]
	}

	lookup[n-1] = fib(n-1)
	lookup[n-2] = fib(n-2)

	return lookup[n-1] + lookup[n-2]
}

module.exports = { fib }
