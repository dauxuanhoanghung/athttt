let container = document.getElementById('container')

toggle = () => {
	container.classList.toggle('sign-in')
	container.classList.toggle('sign-up')
}

//setTimeout(() => {
//	container.classList.add('sign-in')
//}, 200)

const urlParams = new URLSearchParams(window.location.search);
const register = urlParams.get('register'); // "value1"
const param2 = urlParams.get('param2'); // "value2"

if (!!register) {
	container.classList.add('sign-up')
	container.classList.remove('sign-in')
}