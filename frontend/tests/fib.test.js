
const fib = require('./fib').fib

test('testing the fibonacci function', () => {
	expect(fib(0)).toBe(0)
	expect(fib(2)).toBe(1)
	expect(fib(3)).toBe(2)
	expect(fib(10)).toBe(55)
	expect(fib(20)).toBe(6765)
	expect(fib(50)).toBe(12586269025)
})
