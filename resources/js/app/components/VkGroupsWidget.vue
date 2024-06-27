<template>
  <div id="vk_groups"/>
</template>
<script>

export default {
	mounted: function() {
		let vkScript = document.createElement('script');
		vkScript.setAttribute('src', 'https://vk.com/js/api/openapi.js?160');
		document.head.appendChild(vkScript);
		vkScript.onload = this.initWidget;
	},
	methods: {
		initWidget: function() {
			VK.Widgets.Group('vk_groups', {
				mode: 0,
				width: 300,
				height: 160,
				color1: 'f3f3f3',
				color2: '2B587A',
				color3: '5B7FA6'
			}, 108946337);
		}
	},
};
</script>
