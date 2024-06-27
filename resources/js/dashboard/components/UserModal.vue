<template>
  <Modal
    :show="modalShow"
    @open="showCreateModal"
    @close="closeModal"
    @save="beforeSave"
    @delete="deleteUser"
  >
    <template slot="header">
      <h3>{{ modalModeLabel }} данные записавшегося</h3>
    </template>
    <template slot="body">
      <div class="form-group">
        <label for="exampleInputEmail1">Email</label>
        <input
          v-validate="'email'"
          v-model="email"
          :class="{'is-invalid': errors.has('email')}"
          name="email"
          type="email"
          class="form-control"
          data-vv-as="Email"
          aria-describedby="emailHelp">
        <div class="invalid-feedback">
          {{ errors.first('email') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Имя</label>
        <input
          v-validate="'required|min:2|max:255'"
          v-model="name"
          :class="{'is-invalid': errors.has('name')}"
          name="name"
          type="text"
          class="form-control"
          data-vv-as="Имя"
          aria-describedby="emailHelp">
        <div class="invalid-feedback">
          {{ errors.first('name') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Фамилия</label>
        <input
          v-validate="'required|min:2|max:255'"
          v-model="surname"
          :class="{'is-invalid': errors.has('surname')}"
          name="surname"
          type="text"
          class="form-control"
          data-vv-as="Фамилия"
          aria-describedby="emailHelp">
        <div class="invalid-feedback">
          {{ errors.first('surname') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Телефон</label>
        <input
          v-validate="'required|phoneNumber'"
          v-model="phone"
          :class="{'is-invalid': errors.has('phone')}"
          name="phone"
          type="text"
          data-vv-as="Телефон"
          class="form-control">
        <div class="invalid-feedback">
          {{ errors.first('phone') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Группа</label>
        <select
          v-validate="'required'"
          v-model="group_id"
          :class="{'is-invalid': errors.has('group_id')}"
          name="group_id"
          data-vv-as="Группа"
          class="form-control">
          <option
            v-for="group in groups"
            :key="group.id"
            :value="group.id">
            {{ group.name }} ({{ group.timetable }})
          </option>
        </select>
        <div class="invalid-feedback">
          {{ errors.first('group_id') }}
        </div>
      </div>
    </template>
    <template slot="footer">
      <span
        class="btn btn-default"
        @click="closeModal">Отмена</span>
      <button
        v-if="modalMode == constants.mode.UPDATE"
        class="btn btn-outline-danger"
        @click="deleteUser">Удалить</button>
      <button
        class="btn btn-success"
        @click="beforeSave">Сохранить</button>
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
		group_id: {
			get() {
				return this.$store.state.user.model.value.group_id;
			},
			set(val) {
				this.$store.commit('user/setGroup', val);
			},
		},
		...mapState({
			validationErrors: state => state.user.model.validationErrors,
			groups: state => state.group.all,
			modalShow: state => state.user.modalShow,
			modalMode: state => state.user.modalMode,
			constants: state => state.user.constants,
		}),
		...mapGetters('user', [
			'modalModeLabel'
		]),
	},
	methods: {
		async beforeSave () {
			let allValid = await this.$validator.validateAll();
			if (allValid)
				this.$store.dispatch('user/save');
			// if (!this.errors.length)
			// 	this.$store.dispatch('user/save');
		},
		...mapActions('user', {
			deleteUser: 'delete',
		}),
		...mapMutations('user', [
			'closeModal',
			'showCreateModal',
		])
	}
};
</script>
