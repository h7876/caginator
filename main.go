package main

import (
	"encoding/json"
	"github.com/h7876/caginator/internal/response"
	"github.com/mtslzr/pokeapi-go"
	"net/http"

	"github.com/gorilla/mux"
)

//type Ret struct {
//	Name string
//}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Header().Set("Content-Type", "application/json")
		payload := response.Ret{
			Name: "Charlie",
		}
		bytePayload, err := json.MarshalIndent(payload, "", "  ")
		_ = err
		w.Write(bytePayload)
		// vars := mux.Vars(r)
		// title := vars["title"]
		// page := vars["page"]
		// fmt.Fprintf(w, "You've requested the book: %s on page %s\n", title, page)
	})
	r.HandleFunc("/pokedex", func(w http.ResponseWriter, r *http.Request){
		w.WriteHeader(http.StatusOK)
		g, _ := pokeapi.Resource("pokemon")
		w.Header().Set("Content-Type", "application/json")
		pokeByte, err:= json.MarshalIndent(g, "", "  ")
		_= err
		w.Write(pokeByte)
	})
	http.ListenAndServe(":8080", r)
}
