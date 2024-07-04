package initializers

import (
    "log"
    "os"
    "gorm.io/gorm"
    "gorm.io/driver/sqlite"
	"greensage/models"
)


var DB *gorm.DB

func ConnectDB(config *Config) {
    var err error

    // Set the SQLite3 database path
    // dbPath := config.DBPath
    // DB

    DB, err = gorm.Open(sqlite.Open("test.db"), &gorm.Config{}) //?sqlite
    if err != nil {
        log.Fatal("Failed to connect to the Database! \n", err.Error())
        os.Exit(1)
    }

    log.Println("Running Migrations")// status
    err = DB.AutoMigrate(&models.Plant{})
    if err != nil {
        log.Fatal("Migration Failed:  \n", err.Error())
        os.Exit(1)
    }

    log.Println("🚀 Connected Successfully to the Database")
}