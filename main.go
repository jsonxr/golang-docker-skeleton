package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
)

func main() {

	resp, err := http.Get("https://google.com")
	check(err)
	body, err := ioutil.ReadAll(resp.Body)
	check(err)
	s := string(body)
	fmt.Println(s)
}

func check(err error) {
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
