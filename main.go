package main

import (
	"encoding/json"
	"net/http"

	_ "github.com/h7876/caginator/internal/response"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Header().Set("Content-Type", "application/json")
		payload := response.Ret{
			Name: "Hayden",
		}
		bytePayload, err := json.MarshalIndent(payload, "", "  ")
		_ = err
		w.Write(bytePayload)
		// vars := mux.Vars(r)
		// title := vars["title"]
		// page := vars["page"]
		// fmt.Fprintf(w, "You've requested the book: %s on page %s\n", title, page)
	})
	http.ListenAndServe(":8080", r)
}
