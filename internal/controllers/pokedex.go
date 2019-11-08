package controllers

import (
	"encoding/json"
	"github.com/mtslzr/pokeapi-go"
	"net/http"
)

func Pokedex(w http.ResponseWriter, r *http.Request){
	w.WriteHeader(http.StatusOK)
	g, _ := pokeapi.Resource("pokemon")
	w.Header().Set("Content-Type", "application/json")
	pokeByte, err:= json.MarshalIndent(g, "", "  ")
	_= err
	w.Write(pokeByte)
}