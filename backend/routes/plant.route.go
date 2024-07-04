package routes

import (
    "greensage/controllers"
    "github.com/gofiber/contrib/websocket"
    "github.com/gofiber/fiber/v2"
)

func PlantRoutes(router fiber.Router) {
    router.Post("/plant", controllers.CreatePlant )
    router.Get("/ws", websocket.New(func(c *websocket.Conn) {
        controllers.HandleWebSocket(c)
    }))

   

    // Additional routes can be added here if needed
}
