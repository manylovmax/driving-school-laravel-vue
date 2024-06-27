<template>
  <transition name="modal">
    <div
      v-show="show"
      class="modal__mask"
      :class="{'loading': loading}"
      @click="close">
      <div class="modal__wrapper">
        <div class="container-fluid">
          <div class="row justify-content-md-center">
            <div class="col-md-auto">
              <div class="modal__header">
                <slot name="header" />
                <!-- <button
                    type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close"
                    @click="close">
                    <span aria-hidden="true">&times;</span>
                  </button> -->
              </div>
            </div>
          </div>
          <div class="row justify-content-md-center">
            <div class="col-md-auto">
              <div
                class="modal__container"
                @click.stop>
                <div class="modal__body">
                  <slot name="body" />
                </div>
                <div class="modal__footer">
                  <slot name="footer" />
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
		show: { type: Boolean, default: false },
		loading: { type: Boolean, default: false }
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
