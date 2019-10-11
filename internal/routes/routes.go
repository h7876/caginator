package routes

import (
	"github.com/h7876/caginator/internal/controllers"
	"net/http"
)

type Route struct{
	Method string
	Pattern string
	HandlerFunction http.HandlerFunc
}

type Routes []Route
var routes = Routes{
	{
		Method: "get",
		Pattern: "/pokedex",
		HandlerFunction: controllers.Pokedex,
	},
	{
		Method: "get",
		Pattern: "/helloworld",
		HandlerFunction: controllers.HelloWorld,
	},
}
