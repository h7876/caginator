package routes

import "github.com/gorilla/mux"

func Register() *mux.Router {
	app := mux.NewRouter().StrictSlash(true)
	for _,val := range routes{
		app.Methods(val.Method).
			Path(val.Pattern).
			Handler(val.HandlerFunction)
	}
	return app
}
