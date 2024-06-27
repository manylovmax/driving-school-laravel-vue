<template>
  <div
		class="pagintor noselect">
    <div class="pagintor__current-page">
			{{ from }}-{{ to }}&nbsp;из&nbsp;{{ total }}
		</div>
    <div class="pagintor__controls">
      <div
        :class="{disabled: noPrevPage}"
        class="pagintor__arrow-prev"
        @click="goToPrevPage">
        предыдущие
      </div>
      <div>|</div>
      <div
        :class="{disabled: noNextPage}"
        class="pagintor__arrow-next"
        @click="goToNextPage">
        следующие
      </div>
    </div>
  </div>
</template>

<script>
export default {
	props: {
		from: {
			type: Number,
			default: 0
		},
		to: {
			type: Number,
			default: 0
		},
		total: {
			type: Number,
			default: 0
		},
		current_page: {
			type: Number,
			default: 0
		},
		last_page: {
			type: Number,
			default: 0
		},
	},
	computed: {
		noPrevPage: function () {
			return this.current_page == 1;
		},
		noNextPage: function() {
			return this.current_page == this.last_page;
		}
	},
	methods: {
		goToNextPage: function () {
			if (!this.noNextPage)
			  this.$emit('goToNextPage');
		},
		goToPrevPage: function () {
			if (!this.noPrevPage)
			  this.$emit('goToPrevPage');
		}
	}
};
</script>
