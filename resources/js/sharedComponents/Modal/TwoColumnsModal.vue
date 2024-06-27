<template>
  <transition name="modal">
    <div
      v-show="show"
      class="modal__mask"
      @click="close">
      <div class="modal__wrapper">
        <div class="container-fluid">
          <div class="row justify-content-md-center">
            <div class="col-md-8">
              <div class="modal__header">
                <slot name="header">default header</slot>
                <!-- <button
                    type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close"
                    @click="close">
                    <span aria-hidden="true">&times;</span>
                  </button> -->
              </div>
              <div
                class="modal__container"
                @click.stop>
                <div class="modal__body">
                  <div class="container-fluid">
                    <div class="row">
                      <div class="col">
                        <slot name="body-left">default body</slot>
                      </div>
                      <div class="col">
                        <slot name="body-right">default body</slot>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal__footer">
                  <slot name="footer">default footer</slot>
                </div>
              </div>
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
		show: { type: Boolean, default: false }
	},
	mounted: function () {
		document.addEventListener('keydown', (e) => {
			if (this.show && e.keyCode == 27) {
				this.close();
			}
			if (e.keyCode == 13) {
				if (!this.show) {
					this.open();
				} else {
					this.save();
				}
			}
			if (e.keyCode == 46) {
				this.delete();
			}
		});
	},
	methods: {
		close: function () {
			this.$emit('close');
		},
		open: function () {
			this.$emit('open');
		},
		save: function () {
			this.$emit('save');
		},
		delete: function () {
			this.$emit('delete');
		},
	}
};
</script>
