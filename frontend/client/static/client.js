const submit = document.querySelector('.requestAPI')
const result = document.querySelector('.requestResult')

const request_url = 'http://localhost:1337/'

submit.addEventListener('click', handleRequest)

async function handleRequest() {
	const resp = await fetch(request_url, {
		method: 'GET'
	})
	if (resp.status != 200) {
		console.log('Error: could not fetch request.')
		return
	}

	const res = await resp.json()
	if (result == null) {
		console.log('Error: no data fetched.')
		return
	}

	result.innerHTML = JSON.stringify(res)
}
