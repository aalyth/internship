import express from 'express'
import { renderToString } from 'vue/server-renderer'
import { createApp } from './app.js'

const server = express()

server.use(express.static(__dirname + '/../client'))

server.get('/', (req, res) => {
	renderToString(createApp()).then(html => {
		res.send(`
	<!DOCTYPE html>
	<html lang='en'>
		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<meta http-equiv="X-UA-Compatible" content="ie=edge">

			<title> Frontend </title>
			<script defer type='module' src='index.js'> </script>
		</head>

		<body>
			<div id="app"> ${html} </div>
		</body>
	</html>
	`)
	})
})

const port = 3000
server.listen(port, () => {
	console.log(`Server running on port: ${port}`)
})
