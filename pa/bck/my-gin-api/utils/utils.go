package utils

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"net/http"
)

func ParseBody(r *http.Request, x interface{}) {
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		log.Println("Error membaca body:", err)
		return
	}
	log.Println("Request body:", string(body))

	err = json.Unmarshal(body, x)
	if err != nil {
		log.Println("Error parsing JSON:", err)
	}
}
