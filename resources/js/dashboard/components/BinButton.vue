<template>
  <a
    class="btn btn-default"
      @click.prevent="onClick">
    {{label}}
  </a>
</template>

<script>
export default {
	props: {
		label: {
			type: String,
		}
	},
	methods: {
		onClick: function (event) {
			this.$emit('triggerBin');
		}
	},
};
</script>
