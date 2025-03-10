package models

import (
	"github.com/dicky245/my-gin-api/config"
	"github.com/jinzhu/gorm"
)

var db *gorm.DB

type Bimbingan struct {
	gorm.Model
	Keperluan string `gorm:"column:keperluan" json:"keperluan"`
	Tanggal   string `gorm:"column:tanggal" json:"tanggal"`
}

func init() {
	config.Connect()
	db = config.GetDB()
	db.AutoMigrate(&Bimbingan{})
}
func (b *Bimbingan) CreateBimbingan() *Bimbingan {
	db.Create(&b)
	return b
}
func GetAllBimbingan() []Bimbingan {
	var bimbingan []Bimbingan
	db.Find(&bimbingan)
	return bimbingan
}
func GetBimbinganById(id uint) (*Bimbingan, *gorm.DB) {
	var getBimbingan Bimbingan
	db := db.Where("id = ?", id).First(&getBimbingan)
	return &getBimbingan, db
}
func DeleteBimbingan(id uint) Bimbingan {
	var bimbingan Bimbingan
	db.Where("id = ?", id).Delete(&bimbingan)
	return bimbingan
}
