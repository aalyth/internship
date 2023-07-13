package fib

var lookup = make(map[uint32]uint64)
func Fib(n uint32) uint64 {
	if n == 0 {
		return 0
	}

	if n <= 2  {
		return 1
	}

	val, computed := lookup[n]
	if computed  {
		return val
	}

	lookup[n-1] = Fib(n-1)
	lookup[n-2] = Fib(n-2)
	
	return lookup[n-1] + lookup[n-2]
}
