package main

import (
	"fmt"
	"log"
	"os"
	"strconv"
	"time"
)

func main() {
	maxBottlesS, ok := os.LookupEnv("MAX_BOTTLES")
	if !ok {
		maxBottlesS = "999"
	}

	maxBottles, err := strconv.Atoi(maxBottlesS)
	if err != nil {
		log.Fatalf("Error converting MAX_BOTTLES env to int: %s", err.Error())
	}

	for {
		for i := maxBottles; i >= 0; i-- {
			if i == 0 {
				fmt.Printf("Zero bottles of beer on the table, I order %d bottles of beer again!\n", maxBottles)
			} else {
				fmt.Printf("%d bottles of beer on the table, I get one and there are %d bottles left\n", i, i - 1)
			}
			time.Sleep(time.Second)
		}
	}
	
}