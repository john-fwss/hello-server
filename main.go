package main

import (
	"net/http"
)

func main() {
	if err := http.ListenAndServe("localhost:8080", helloHandler{}); err != nil {
		panic(err)
	}
}

type helloHandler struct{}

func (helloHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte(`oh hello there`))
}
