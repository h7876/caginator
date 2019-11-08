package main

import (
	_"encoding/json"
	"github.com/h7876/caginator/internal/response"
	"github.com/mtslzr/pokeapi-go"
	_"html/template"
	"net/http"
	"fmt"
	"github.com/gorilla/mux"
	"strings"
)

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/pokedex", func(w http.ResponseWriter, r *http.Request){
		w.WriteHeader(http.StatusOK)
		g, _:= pokeapi.Resource("pokemon")
		w.Header().Set("Content-Type", "application/json")

		for i := 0; i < len(g.Results); i++ {
			var payload = response.Poke{
				Name: g.Results[i].Name,
				Url:  g.Results[i].URL,
			}
			var name = strings.Trim(payload.Name, "\"")
			var url= strings.Trim(payload.Url, "\"")
			fmt.Fprintf(w, "<h1>%s</h1>", name)
			fmt.Fprintf(w, "<h3>%s</h3>", url)
		}
	})
	http.ListenAndServe(":8080", r)
}
