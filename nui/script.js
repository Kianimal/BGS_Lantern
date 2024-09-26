window.addEventListener("load", function () {

	const redSlider = document.getElementById('red-slider');
	const greenSlider = document.getElementById('green-slider');
	const blueSlider = document.getElementById('blue-slider');
	const brightnessSlider = document.getElementById('brightness-slider');

	window.addEventListener("keydown", function (event) {
		if (event.key === 'Escape') {
			fetch(`https://${GetParentResourceName()}/lantern-menu-close`, {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json; charset=UTF-8',
				},
				body: JSON.stringify({
					red: redSlider.value,
					green: greenSlider.value,
					blue: blueSlider.value,
					brightness: parseFloat(brightnessSlider.value).toFixed(1),
				})
			});
			this.document.getElementById("container").style.display = "none";
		}
	});

	document.getElementById("close-button").addEventListener("click", function (event) {
		fetch(`https://${GetParentResourceName()}/lantern-menu-close`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json; charset=UTF-8',
			},
			body: JSON.stringify({
				red: redSlider.value,
				green: greenSlider.value,
				blue: blueSlider.value,
				brightness: parseFloat(brightnessSlider.value).toFixed(1),
			})
		});
		document.getElementById("container").style.display = "none";
	});

	redSlider.addEventListener('input', (event) => {
		// This function will be called every time the slider value changes
		// console.log('Slider value:', event.target.value);
		fetch(`https://${GetParentResourceName()}/lantern-menu-update`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json; charset=UTF-8',
			},
			body: JSON.stringify({
				red: redSlider.value,
				green: greenSlider.value,
				blue: blueSlider.value,
			})
		});
	});

	greenSlider.addEventListener('input', (event) => {
		// This function will be called every time the slider value changes
		// console.log('Slider value:', event.target.value);
		fetch(`https://${GetParentResourceName()}/lantern-menu-update`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json; charset=UTF-8',
			},
			body: JSON.stringify({
				red: redSlider.value,
				green: greenSlider.value,
				blue: blueSlider.value,
			})
		});
	});

	blueSlider.addEventListener('input', (event) => {
		// This function will be called every time the slider value changes
		// console.log('Slider value:', event.target.value);
		fetch(`https://${GetParentResourceName()}/lantern-menu-update`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json; charset=UTF-8',
			},
			body: JSON.stringify({
				red: redSlider.value,
				green: greenSlider.value,
				blue: blueSlider.value,
			})
		});
	});

	brightnessSlider.addEventListener('input', (event) => {
		// This function will be called every time the slider value changes
		// console.log('Slider value:', event.target.value);
		fetch(`https://${GetParentResourceName()}/lantern-menu-update`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json; charset=UTF-8',
			},
			body: JSON.stringify({
				red: redSlider.value,
				green: greenSlider.value,
				blue: blueSlider.value,
				brightness: parseFloat(brightnessSlider.value).toFixed(1),
			})
		});
	});
});

window.addEventListener("message", (event) => {

	data = event.data

	if (data.type === "lantern-menu-open") {
		document.getElementById("container").style.display = "flex";
		document.getElementById("brightness-slider").max = data.maxBrightness;
	}
});