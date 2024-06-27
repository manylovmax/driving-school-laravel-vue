<template>
  <div />
</template>
<script>
import axios from 'axios';

export default {
	props: {
		page: {
			type: String, default: () => 'home'
		}
	},
	mounted: function () {
		let script = document.createElement('script');
		script.setAttribute('src', 'https://www.google.com/recaptcha/api.js?render=6Le0hX4UAAAAAKC7LMUfblfPubKlO2OCAyqVUkan');
		document.head.appendChild(script);
		script.onload = this.initWidget;
	},
	methods: {
		initWidget: function () {
			const page = this.page;
			const checkToken = this.checkToken;
			grecaptcha.ready(function () {
				grecaptcha.execute('6Le0hX4UAAAAAKC7LMUfblfPubKlO2OCAyqVUkan', { action: page })
					.then(function (token) {
						return checkToken(token);
					});
			});
		},
		checkToken: async function (token) {
			try {
				const {
					data,
					status
				} = await axios.get(`/api/auth/recaptcha/${token}`);
				if (status == 204) {

					return true;
				}
			} catch (error) {
				console.assert('Ошибка при проверке капчи');
			}

			return false;
		},
	},
};
</script>
