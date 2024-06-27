<template>
  <div id="vk_community_messages" />
</template>
<script>

export default {
	mounted: function () {
		if (window.innerWidth <= 992)
			return;
		let vkScript = document.createElement('script');
		vkScript.setAttribute('src', 'https://vk.com/js/api/openapi.js?160');
		document.head.appendChild(vkScript);
		vkScript.onload = this.initWidget;
	},
	methods: {
		initWidget: function () {
			VK.Widgets.CommunityMessages('vk_community_messages', 108946337, { tooltipButtonText: 'Есть вопрос?', expanded: false });
		}
	},
};
</script>
