<template>
  <Modal
    :show="message.show">
    <template slot="header">
      <h3>{{ message.type }}</h3>
    </template>
    <template slot="body">
      {{ message.text }}
    </template>
  </Modal>
</template>

<script>
import Modal from './Modal/Modal';
import { mapState, mapActions, mapMutations, mapGetters } from 'vuex';

export default {
	components: {
		Modal,
	},
	computed: {
		...mapState({
			message: state => state.user.message,
		}),
	},
};
</script>
