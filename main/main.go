package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"

	"github.com/chefgs/linktoqr/render" 
)

var addr = flag.String("addr", ":1718", "http service address") // Q=17, R=18

func main() {
	fmt.Println("\nURL to QR Converter Running.. Now access http://localhost:1718/")

	flag.Parse()
	http.Handle("/", http.HandlerFunc(render.RenderHtmlPage)) 
	err := http.ListenAndServe(*addr, nil)
	if err != nil {
		log.Fatal("ListenAndServe:", err)
	}
}
