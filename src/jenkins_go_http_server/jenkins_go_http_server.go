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

func ReturnName(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("My name is TJ."))
}

func JenkinsTest(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Continuous deployment success."))
}

func main() {
	http.HandleFunc("/JenkinsTest", JenkinsTest)
	http.HandleFunc("/Hello", HelloServer)
	http.HandleFunc("/Name", ReturnName)
	err := http.ListenAndServe(":12345", nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
