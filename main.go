package main

import (
	"fmt"

	"github.com/flavio/tinygo-wasi-symbol-bug/resource"
)

func main() {
	_, err := resource.ParseQuantity("1k")
	if err != nil {
		panic(err)
	}

	fmt.Printf("ciao\n")
}
