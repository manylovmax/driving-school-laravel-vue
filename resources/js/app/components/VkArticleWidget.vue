<template>
  <div class="my-4" id="vk_article_-160640397_55441" />
</template>
<script>
export default {
  mounted: function() {
    let vkScript = document.createElement("script");
    vkScript.setAttribute("src", "https://vk.com/js/api/openapi.js?162");
    document.head.appendChild(vkScript);
    vkScript.onload = this.initWidget;
  },
  methods: {
    initWidget: function() {
      VK.Widgets.Article(
        "vk_article_-160640397_55441",
        "@blog.voenmeh.avtoshkola-statya-o-pokupke-pervogo-avtomobilya"
      );
    }
  }
};
</script>
