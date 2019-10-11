package main

import (
	"github.com/h7876/caginator/internal/routes"
	"net/http"
)

//type Ret struct {
//	Name string
//}

func main() {
	r := routes.Register()
	http.ListenAndServe(":8080", r)
}
