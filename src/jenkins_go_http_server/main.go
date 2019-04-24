package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

// hello world, the web server
func HelloServer(w http.ResponseWriter, r *http.Request) {
	body, _ := ioutil.ReadAll(r.Body)
	defer r.Body.Close()
	body_str := string(body)
	fmt.Println(body_str)
	w.Write([]byte("Hello World!"))
}

func main() {
	http.HandleFunc("/hello", HelloServer)
	err := http.ListenAndServe(":12345", nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
