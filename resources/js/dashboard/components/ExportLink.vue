<template>
  <div
    v-show="show"
    class="export-link"
  >
    <a
      :href="link"
      @click.prevent="onClick"
    >
      <slot />
    </a>
  </div>
</template>
<script>
import axios from 'axios';

export default {
	props: {
		link: {
			type: String,
			default: '/404'
		},
		show: {
			type: Boolean,
			default: false
		}
	},
	methods: {
		onClick: function () {
			const url = this.link;

			if (url == '/404' || url.length == 0)
				return;

			axios({
				url,
				method: 'GET',
				responseType: 'blob',
			}).then((response) => {
				const blobURL = window.URL.createObjectURL(new Blob([response.data]));
				const tempLink = document.createElement('a');
				tempLink.style.display = 'none';
				tempLink.href = blobURL;
				tempLink.setAttribute('download', 'group.xlsx');
				document.body.appendChild(tempLink);
				tempLink.click();
				document.body.removeChild(tempLink);
				window.URL.revokeObjectURL(blobURL);
			}).catch((error) => {
				// Error
				if (error.response) {
					// The request was made and the server responded with a status code
					// that falls out of the range of 2xx
					// console.log(error.response.data);
					// console.log(error.response.status);
					// console.log(error.response.headers);
				} else if (error.request) {
					// The request was made but no response was received
					// `error.request` is an instance of XMLHttpRequest in the browser and an instance of
					// http.ClientRequest in node.js
					console.log(error.request);
				} else {
					// Something happened in setting up the request that triggered an Error
					console.log('Error', error.message);
				}
				console.log(error.config);
			});
		}
	}
};
</script>
