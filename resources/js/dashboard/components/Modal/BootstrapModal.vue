<template>
  <transition name="modal">
    <div
      v-show="show"
      class="modal-mask"
      @click="close">
      <div class="modal">
        <div
          class="modal-dialog"
          role="document">
          <div
            class="modal-content"
            @click.stop>
            <div class="modal-header">
              <slot name="header">default header</slot>
            </div>
            <div class="modal-body">
              <slot name="body">default body</slot>
            </div>
            <div class="modal-footer">
              <slot name="footer">default footer</slot>
            </div>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
	props: {
		show: {type: Boolean, default: false}
	},
	mounted: function () {
		document.addEventListener('keydown', (e) => {
			if (this.show && e.keyCode == 27) {
				this.close();
			}
		});
	},
	methods: {
		close: function() {
			this.$emit('close');
		},
	}
};
</script>
