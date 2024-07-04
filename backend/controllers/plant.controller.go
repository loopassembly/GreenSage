package controllers

import (
	"greensage/initializers"
	"greensage/models"
	"log"

	"github.com/gofiber/contrib/websocket"
	"github.com/gofiber/fiber/v2"
)

func CreatePlant(c *fiber.Ctx) error {
	// Parse the request body
	var input models.PlantInput
	if err := c.BodyParser(&input); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
			"message": "Bad Request",
			"error":   err.Error(),
		})
	}

	// Create a new plant record
	plant := models.Plant{
		Name:     input.Name,
		Type:     input.Type,
		Sunlight: input.Sunlight,
		Water:    input.Water,
		Humidity: input.Humidity,
	}

	// Save the plant record
	initializers.DB.Create(&plant)

	// Return the response
	return c.Status(fiber.StatusCreated).JSON(fiber.Map{
		"message": "Plant record created successfully",
		"plant":   plant,
	})
}

func helathCheck(c *fiber.Ctx) error {
	return c.SendString("Server is up and running")
}

// func HandleWebSocket(c *websocket.Conn) {
// 	// Defer closing the connection when the function returns
// 	defer c.Close()

// 	// Infinite loop to continuously read messages from the WebSocket connection
// 	for {
// 		// Read message from the WebSocket connection
// 		mt, msg, err := c.ReadMessage()
// 		if err != nil {
// 			log.Println("read:", err)
// 			break
// 		}

// 		// Log the received message
// 		log.Printf("recv: %s", msg)

// 		// Process the message (you can add your logic here)

// 		// Echo the message back to the client
// 		err = c.WriteMessage(mt, msg)
// 		if err != nil {
// 			log.Println("write:", err)
// 			break
// 		}
// 	}
// }

func newtemp(c *websocket.Conn) {
	// Defer closing the connection when the function returns
	defer c.Close()

	// Infinite loop to continuously read messages from the WebSocket connection
	for {
		// Read message from the WebSocket connection
		mt, msg, err := c.ReadMessage()
		if err != nil {
			log.Println("read:", err)
			break
		}

		// Log the received message
		log.Printf("recv: %s", msg)

		// Process the message (you can add your logic here)

		// Echo the message back to the client
		err = c.WriteMessage(mt, msg)
		if err := c.WriteMessage(websocket.TextMessage, []byte("Temperature data received")); err != nil {
			log.Println("write:", err)
			break
		}
	}
}

func handleHumidityData3(c *websocket.Conn) {
	// Defer closing the connection when the function returns
	defer c.Close()

	// Infinite loop to continuously read messages from the WebSocket connection
	for {
		// Read message from the WebSocket connection
		mt, msg, err := c.ReadMessage()
		if err != nil {
			log.Println("read:", err)
			break
		}

		// Log the received message
		log.Printf("recv: %s", msg)

		// Process the message (you can add your logic here)

		// Echo the message back to the client
		err = c.WriteMessage(mt, msg)
		if err != nil {
			log.Println("write:", err)
			break
		}
	}
}

func handleWaterPumpControl(c *websocket.Conn) {
	defer c.Close()

	for {
		_, _, err := c.ReadMessage()
		if err != nil {
			log.Println("read:", err)
			break
		}

		// Process the received water pump control data

		if err := c.WriteMessage(websocket.TextMessage, []byte("Water pump control data received")); err != nil {
			log.Println("write:", err)
			break
		}
	}
}

func handleMoistureData(c *websocket.Conn) {
	defer c.Close()

	for {
		_, _, err := c.ReadMessage()
		if err != nil {
			log.Println("read:", err)
			break
		}

		// Process the received moisture data

		if err := c.WriteMessage(websocket.TextMessage, []byte("Moisture data received")); err != nil {
			log.Println("write:", err)
			break
		}
	}
}
