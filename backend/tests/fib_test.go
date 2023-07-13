package fib

import (
	"testing"
)

func TestFib(t *testing.T) {
	if Fib(0) != 0 {
		t.Errorf("Erorr: fib(0) is not 0.")
	}

	if Fib(2) != 1 {
		t.Errorf("Erorr: fib(2) is not 2.")
	}

	if Fib(3) != 2 {
		t.Errorf("Erorr: fib(3) is not 3.")
	}

	if Fib(10) != 55 {
		t.Errorf("Erorr: fib(10) is not 55.")
	}

	if Fib(20) != 6765 {
		t.Errorf("Erorr: fib(20) is not 6765.")
	}

	if Fib(100) != 3736710778780434371 {
		t.Errorf("Erorr: fib(100) is not 3736710778780434371.")
	}

	if Fib(1234567) != 14656744304168315661 {
		t.Errorf("Erorr: fib(1234567) is not 14656744304168315661.")
	}
}
