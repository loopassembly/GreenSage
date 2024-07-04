package models

import (
	"time"

	"github.com/go-playground/validator"
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Plant struct {
    ID        string    `gorm:"type:string;primary_key"`
    Name      string    `gorm:"type:varchar(100);not null"`
    Type      string    `gorm:"type:varchar(100);not null"`
    Sunlight  string    `gorm:"type:varchar(100);not null"`
    Water     string    `gorm:"type:varchar(100);not null"`
    Humidity  string    `gorm:"type:varchar(100);not null"`
    CreatedAt time.Time `gorm:"type:datetime;not null;default:CURRENT_TIMESTAMP"`
    UpdatedAt time.Time `gorm:"type:datetime;not null;default:CURRENT_TIMESTAMP"`
}

func (p *Plant) BeforeCreate(tx *gorm.DB) error {
    // Generate a new UUID
    uuid, err := uuid.NewUUID()
    if err != nil {
        return err
    }

    // Set the UUID as the primary key
    p.ID = uuid.String()

    return nil
}

type PlantInput struct {
    Name     string `json:"name" validate:"required"`
    Type     string `json:"type" validate:"required"`
    Sunlight string `json:"sunlight" validate:"required"`
    Water    string `json:"water" validate:"required"`
    Humidity string `json:"humidity" validate:"required"`
}

type PlantResponse struct {
    ID        uuid.UUID `json:"id,omitempty"`
    Name      string    `json:"name,omitempty"`
    Type      string    `json:"type,omitempty"`
    Sunlight  string    `json:"sunlight,omitempty"`
    Water     string    `json:"water,omitempty"`
    Humidity  string    `json:"humidity,omitempty"`
    CreatedAt time.Time `json:"created_at"`
    UpdatedAt time.Time `json:"updated_at"`
}

func FilterPlantRecord(plant *Plant) PlantResponse {
    id := plant.ID
    return PlantResponse{
        ID:        uuid.MustParse(id),
        Name:      plant.Name,
        Type:      plant.Type,
        Sunlight:  plant.Sunlight,
        Water:     plant.Water,
        Humidity:  plant.Humidity,
        CreatedAt: plant.CreatedAt,
        UpdatedAt: plant.UpdatedAt,
    }
}

var validate = validator.New()

type ErrorResponse struct {
    Field string `json:"field"`
    Tag   string `json:"tag"`
    Value string `json:"value,omitempty"`
}

func ValidatePlantInput(payload PlantInput) []*ErrorResponse {
    var errors []*ErrorResponse
    err := validate.Struct(payload)
    if err != nil {
        for _, err := range err.(validator.ValidationErrors) {
            var element ErrorResponse
            element.Field = err.StructNamespace()
            element.Tag = err.Tag()
            element.Value = err.Param()
            errors = append(errors, &element)
        }
    }
    return errors
}
