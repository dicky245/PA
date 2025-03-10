package controller

import (
	"encoding/json"
	"net/http"
	"strconv"

	"github.com/dicky245/my-gin-api/models"
	"github.com/dicky245/my-gin-api/utils"
	"github.com/gorilla/mux"
)

func GetBimbingan(w http.ResponseWriter, r *http.Request) {
	allBimbingan := models.GetAllBimbingan()
	res, _ := json.Marshal(allBimbingan)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func GetBimbinganById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	bimbinganId := vars["id"]

	ID, err := strconv.ParseUint(bimbinganId, 10, 64)
	if err != nil {
		http.Error(w, "Invalid bimbingan ID", http.StatusBadRequest)
		return
	}

	bimbinganDetails, _ := models.GetBimbinganById(uint(ID))
	if bimbinganDetails.ID == 0 {
		http.Error(w, "Bimbingan not found", http.StatusNotFound)
		return
	}

	res, _ := json.Marshal(bimbinganDetails)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func CreateBimbingan(w http.ResponseWriter, r *http.Request) {
	newBimbingan := &models.Bimbingan{}
	utils.ParseBody(r, newBimbingan)
	b := newBimbingan.CreateBimbingan()

	res, _ := json.Marshal(b)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusCreated)
	w.Write(res)
}
func UpdateBimbingan(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	bimbinganId := vars["id"]

	ID, err := strconv.ParseUint(bimbinganId, 10, 64)
	if err != nil {
		http.Error(w, "Invalid bimbingan ID", http.StatusBadRequest)
		return
	}

	bimbinganDetails, db := models.GetBimbinganById(uint(ID))
	if bimbinganDetails.ID == 0 {
		http.Error(w, "Bimbingan not found", http.StatusNotFound)
		return
	}

	updatedBimbingan := &models.Bimbingan{}
	utils.ParseBody(r, updatedBimbingan)

	if updatedBimbingan.Keperluan != "" {
		bimbinganDetails.Keperluan = updatedBimbingan.Keperluan
	}
	if updatedBimbingan.Tanggal != "" {
		bimbinganDetails.Tanggal = updatedBimbingan.Tanggal
	}

	db.Save(&bimbinganDetails)
	res, _ := json.Marshal(bimbinganDetails)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func DeleteBimbingan(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	bimbinganId := vars["id"]

	ID, err := strconv.ParseUint(bimbinganId, 10, 64)
	if err != nil {
		http.Error(w, "Invalid bimbingan ID", http.StatusBadRequest)
		return
	}

	bimbingan := models.DeleteBimbingan(uint(ID))
	res, _ := json.Marshal(bimbingan)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
