<template>
  <nav
    id="mainNav"
    :class="{'navbar-shrink': !transparent}"
    class="navbar navbar-expand-lg navbar-light fixed-top"
  >
    <div class="container">
      <span class="navbar-brand js-scroll-trigger">
        <slot name="title" />
      </span>
      <button
        class="navbar-toggler navbar-toggler-right"
        type="button"
        data-toggle="collapse"
        data-target="#navbarResponsive"
        aria-controls="navbarResponsive"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon" />
      </button>
      <div
        id="navbarResponsive"
        class="collapse navbar-collapse"
      >
        <ul class="navbar-nav ml-auto">
          <slot name="links" />
        </ul>
      </div>
    </div>
  </nav>
</template>
<script>
export default {
	data () {
		return {
			screenTop: 0,
			location: '',
			transparent: false,
		};
	},
	watch: {
		screenTop(val) {
			this.updateTransparent(val, this.location);
		},
		$route (to, from) {
			this.updateTransparent(this.screenTop, val);
		}
	},
	created () {
		this.updateTransparent(window.screenTop, this.$route.path);
		window.addEventListener('scroll', this.handleScroll);
	},
	destroyed () {
		window.removeEventListener('scroll', this.handleScroll);
	},
	methods: {
		updateTransparent: function (top=0, loc='') {
			this.screenTop = top;
			this.location = loc;
			this.transparent = loc == '/index' && top <= 128;
		},
		handleScroll () {
			this.top = window.screenTop;
		}
	},
};
</script>
