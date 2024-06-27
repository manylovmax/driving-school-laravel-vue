<template>
  <Modal
    :show="modalShow"
    :loading="modalLoading"
    @close="closeModal"
    @save="beforeSave"
  >
    <template slot="header">
      <h3>Форма записи</h3>
    </template>
    <template slot="body">
      <div class="form-group">
        <label for="exampleInputEmail1">Email*</label>
        <input
          v-validate="'email|required'"
          data-vv-as="Email"
          v-model="email"
          :class="{'is-invalid': errors.has('email')}"
          name="email"
          type="email"
          class="form-control"
          aria-describedby="emailHelp">
        <div class="invalid-feedback">
          {{ errors.first('email') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Имя*</label>
        <input
          v-validate="'required|min:2|max:255'"
          v-model="name"
          data-vv-as="Имя"
          :class="{'is-invalid': errors.has('name')}"
          name="name"
          type="text"
          class="form-control"
          aria-describedby="emailHelp">
        <div class="invalid-feedback">
          {{ errors.first('name') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Фамилия*</label>
        <input
          v-validate="'required|min:2|max:255'"
          v-model="surname"
          data-vv-as="Фамилия"
          :class="{'is-invalid': errors.has('surname')}"
          name="surname"
          type="text"
          class="form-control"
          aria-describedby="emailHelp">
        <div class="invalid-feedback">
          {{ errors.first('surname') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Телефон*<sup>1</sup></label>
        <input
          v-validate="'required|phoneNumber'"
          v-model="phone"
          data-vv-as="Телефон"
          :class="{'is-invalid': errors.has('phone')}"
          name="phone"
          type="text"
          id="input-phone"
          class="form-control">
        <div class="invalid-feedback">
          {{ errors.first('phone') }}
        </div>
      </div>
      <p class="text-muted">*обязательные для заполнения поля</p>
      <p class="text-muted"><sup>1</sup>номер телефона необходимо писать с "+7"</p>
    </template>
    <template slot="footer">
      <span
        class="btn btn-default"
        @click="closeModal">Отмена</span>
      <button
        class="btn gray-400"
        @click="beforeSave">Записаться</button>
    </template>
  </Modal>
</template>

<script>
import Modal from '~/resources/js/sharedComponents/Modal/Modal';
import Inputmask from 'inputmask';

import { mapState, mapActions, mapMutations, mapGetters } from 'vuex';

export default {
	components: {
		Modal,
  },
  mounted() {
    let im = new Inputmask("+7 \(999\) 999 9999").mask(document.getElementById('input-phone'));
  },
	computed: {
		name: {
			get() {
				return this.$store.state.user.model.value.name;
			},
			set(val) {
				this.$store.commit('user/setName', val);
			},
		},
		surname: {
			get() {
				return this.$store.state.user.model.value.surname;
			},
			set(val) {
				this.$store.commit('user/setSurname', val);
			},
		},
		phone: {
			get() {
				return this.$store.state.user.model.value.phone;
			},
			set(val) {
				this.$store.commit('user/setPhone', val);
			},
		},
		email: {
			get() {
				return this.$store.state.user.model.value.email;
			},
			set(val) {
				this.$store.commit('user/setEmail', val);
			},
		},
		...mapState({
			validationErrors: state => state.user.model.validationErrors,
			groups: state => state.group.all,
      modalShow: state => state.user.modalShow,
      modalLoading: state => state.user.modalLoading,
			modalMode: state => state.user.modalMode,
			constants: state => state.user.constants,
		}),
		...mapGetters('user', [
			'modalModeLabel'
		]),
	},
	methods: {
		async beforeSave () {
			const allValid = await this.$validator.validateAll();
			if (allValid)
				this.$store.dispatch('user/signup');
		},
		...mapMutations('user', [
			'closeModal',
		])
	}
};
</script>
