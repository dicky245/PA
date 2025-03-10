package routes

import (
	"github.com/dicky245/my-gin-api/controller"
	"github.com/gorilla/mux"
)

var RegisterBimbinganRoutes = func(router *mux.Router) {
	router.HandleFunc("/bimbingan/",
		controller.CreateBimbingan).Methods("POST")
	router.HandleFunc("/bimbingan/", controller.GetBimbingan).Methods("GET")
	router.HandleFunc("/bimbingan/{id}",
		controller.GetBimbinganById).Methods("GET")
	router.HandleFunc("/bimbingan/{id}",
		controller.UpdateBimbingan).Methods("PUT")
	router.HandleFunc("/bimbingan/{id}",
		controller.DeleteBimbingan).Methods("DELETE")
}
