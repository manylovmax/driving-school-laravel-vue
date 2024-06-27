<template>
  <Modal
    :show="modalShow"
    @close="closeModal"
    @delete="deleteGroup"
    @save="saveGroup"
    @open="showCreateModal">
    <template slot="header">
      <h3>{{ modalModeLabel }} группу</h3>
    </template>
    <template slot="body">
      <div class="form-group">
        <label for="exampleInputEmail1">Название</label>
        <input
          v-validate="'required|min:2|max:255'"
          :class="{'is-invalid': errors.has('name')}"
          v-model="name"
          name="name"
          maxlength="255"
          class="form-control"
          type="text"
          aria-describedby="emailHelp"
          placeholder="Название">
        <div class="invalid-feedback">
          {{ errors.first('name') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Описание</label>
        <input
          v-validate="'required|min:2|max:255'"
          :class="{'is-invalid': errors.has('description')}"
          v-model="description"
          name="description"
          maxlength="255"
          class="form-control"
          type="text"
          aria-describedby="emailHelp"
          placeholder="description">
        <div class="invalid-feedback">
          {{ errors.first('description') }}
        </div>
      </div>
      <div class="form-group">
        <label>Статус</label>
        <multiselect
          v-validate="'required'"
          :options="constants.groupStatuses"
          :class="{'is-invalid': errors.has('status')}"
          v-model="status"
          name="status"
          label="value"
          track-by="value" />
        <div class="invalid-feedback">
          {{ errors.first('status') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Стоимость обучения</label>
        <input
          v-validate="'required'"
          v-model="price"
          :class="{'is-invalid': errors.has('price')}"
          type="number"
          name="price"
          class="form-control"
          aria-describedby="emailHelp"
          placeholder="Стоимость обучения">
        <div class="invalid-feedback">
          {{ errors.first('price') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Стоимость обучения для студентов</label>
        <input
          v-validate="'required'"
          v-model="price_for_students"
          :class="{'is-invalid': errors.has('price_for_students')}"
          type="number"
          name="price_for_students"
          class="form-control"
          aria-describedby="emailHelp"
          placeholder="Стоимость обучения для студентов">
        <div class="invalid-feedback">
          {{ errors.first('price_for_students') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Категория</label>
        <multiselect
          v-validate="'required'"
          :options="constants.groupCategories"
          :class="{'is-invalid': errors.has('category')}"
          v-model="category"
          name="category"
          label="value"
          track-by="value" />
        <div class="invalid-feedback">
          {{ errors.first('category') }}
        </div>
      </div>
    </template>
    <template slot="footer">
      <span
        class="btn button-default"
        @click="closeModal">Отмена</span>
      <button
        v-if="modalMode == constants.mode.UPDATE"
        class="btn btn-outline-danger"
        @click="deleteGroup">Удалить</button>
      <button
        class="btn btn-success"
        @click="saveGroup">Сохранить</button>
    </template>
  </Modal>
</template>

<script>
import Modal from './Modal/Modal';
import Multiselect from 'vue-multiselect';
import { mapState, mapActions, mapMutations, mapGetters } from 'vuex';

export default {
	components: {
		Modal,
		Multiselect
	},
	computed: {
		name: {
			get() {
				return this.$store.state.personalTraining.model.value.name;
			},
			set(val) {
				this.$store.commit('personalTraining/setName', val);
			},
		},
		description: {
			get() {
				return this.$store.state.personalTraining.model.value.description;
			},
			set(val) {
				this.$store.commit('personalTraining/setModelAttribute', {'description': val});
			},
		},
		status: {
			get() {
				return this.$store.state.personalTraining.model.value.status;
			},
			set(val) {
				this.$store.commit('personalTraining/setStatus', val);
			},
		},
		price: {
			get() {
				return this.$store.state.personalTraining.model.value.price;
			},
			set(val) {
				this.$store.commit('personalTraining/setPrice', val);
			},
		},
		price_for_students: {
			get() {
				return this.$store.state.personalTraining.model.value.price_for_students;
			},
			set(val) {
				this.$store.commit('personalTraining/setPriceForStudents', val);
			},
		},
		category: {
			get() {
				return this.$store.state.personalTraining.model.value.category;
			},
			set(val) {
				this.$store.commit('personalTraining/setCategory', val);
			},
		},


		...mapState({
			validationErrors: state => state.personalTraining.model.validationErrors,
			modalShow: state => state.personalTraining.modalShow,
			modalMode: state => state.personalTraining.modalMode,
			constants: state => state.personalTraining.constants,
		}),
		...mapGetters('personalTraining',[
			'modalModeLabel'
		]),
	},
	methods: {
		async saveGroup() {
			let allValid = await this.$validator.validateAll();
			if (allValid)
				this.$store.dispatch('personalTraining/save');
		},
		...mapActions('personalTraining', {
			deleteGroup: 'delete',
		}),
		...mapMutations('personalTraining', [
			'closeModal',
			'showCreateModal'
		])
	},
};
</script>
