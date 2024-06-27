<template>
  <input
    :value="value"
    class="search-input"
    maxlength="255"
    type="text"
    @input="input">
</template>

<script>
export default {
	props: {
		value: {
			type: String,
			default: ''
		}
	},
	methods: {
		input: function (event) {
			this.$emit('input', event.target.value);
		}
	}
};
</script>
