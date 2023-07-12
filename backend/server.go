package main 

import (
	"github.com/gin-gonic/gin"
)

func main() {
	gin.SetMode(gin.ReleaseMode)
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"reply": "it works",
		})
	})

	r.GET("/hc", func(c *gin.Context) {
		c.Status(200)
	})

	r.Run(":1337")
}
