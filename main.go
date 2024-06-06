package main

import (
	"fmt"
	"gin-ranking/router"
)

func main() {
	r := router.Router()
	r.Run(":9999")
	fmt.Println("f:", f())
}

func f() (result int) {
	defer fmt.Println(1)
	defer fmt.Println(2)
	defer func() {
		if err := recover(); err != nil {
			fmt.Println("recover from panic:", err)
		}
	}()
	defer func() {
		result = 10
	}()
	defer fmt.Println(3)
	panic("11")
}
