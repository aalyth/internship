const express = require('express')

const app = express()

app.use(express.static('./client/static'))

app.get('/', (req, res) => {
	res.sendFile('/client/index.html', { root: './' })
})

app.get('/hc', (req, res) => {
	res.sendStatus(200)	
})

const port = 3000
app.listen(port, () => {
	console.log(`Starting server on port: ${port}`)
})

