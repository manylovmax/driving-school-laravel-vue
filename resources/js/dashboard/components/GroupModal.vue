<template>
  <TwoColumnsModal
    :show="modalShow"
    @close="closeModal"
    @delete="deleteGroup"
    @save="saveGroup"
    @open="showCreateModal">
    <template slot="header">
      <h3>{{ modalModeLabel }} группу</h3>
    </template>
    <template slot="body-left">
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
    <template slot="body-right">
      <div class="form-group">
        <label for="exampleInputEmail1">Начало занятий</label>
        <input v-model="start_at" v-validate="'required'" style="display:none" />
        <datepicker
          format="dd/MM/yyyy"          
          class="form-control"
          placeholder="Начало занятий"
          v-model="start_at"
          :class="{'is-invalid': errors.has('start_at')}"
        ></datepicker>
        <div class="invalid-feedback">
          {{ errors.first('start_at') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Экзамен</label>
        <datepicker
          format="dd/MM/yyyy" 
          class="form-control"
          placeholder="Экзамен"
          v-model="exam_date"
        ></datepicker>
        <div class="invalid-feedback">
          {{ errors.first('exam_date') }}
        </div>
      </div>
      <div class="form-group">
        <label>Дни занятий</label>
        <multiselect
          v-validate="'required'"
          v-model="timetable"
          :options="constants.weekdays"
          :class="{'is-invalid': errors.has('timetable')}"
          :multiple="true"
          :close-on-select="false"
          :clear-on-select="false"
          class="form-control"
          name="timetable" />
        <div class="invalid-feedback">
          {{ errors.first('timetable') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Начало занятия</label>
        <input
          v-validate="'required'"
          v-model="hours_start_at"
          :class="{'is-invalid': errors.has('hours_start_at')}"
          min="9:00"
          max="21:00"
          pattern="[0-9]{2}:[0-9]{2}"
          type="time"
          class="form-control"
          aria-describedby="emailHelp"
          name="hours_start_at"
          placeholder="Начало занятия">
        <div class="invalid-feedback">
          {{ errors.first('hours_start_at') }}
        </div>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Конец занятия</label>
        <input
          v-validate="'required'"
          v-model="hours_finish_at"
          :class="{'is-invalid': errors.has('hours_finish_at')}"
          name="hours_finish_at"
          type="time"
          min="9:00"
          max="21:00"
          pattern="[0-9]{2}:[0-9]{2}"
          class="form-control"
          aria-describedby="emailHelp"
          placeholder="Конец занятия">
        <div class="invalid-feedback">
          {{ errors.first('hours_finish_at') }}
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
  </TwoColumnsModal>
</template>

<script>
import TwoColumnsModal from './Modal/TwoColumnsModal';
import Multiselect from 'vue-multiselect';
import { mapState, mapActions, mapMutations, mapGetters } from 'vuex';
import Datepicker from 'vuejs-datepicker';

export default {
	components: {
		TwoColumnsModal,
    Multiselect,
    Datepicker
	},
	computed: {
		name: {
			get() {
				return this.$store.state.group.model.value.name;
			},
			set(val) {
				this.$store.commit('group/setName', val);
			},
		},
		description: {
			get() {
				return this.$store.state.group.model.value.description;
			},
			set(val) {
				this.$store.commit('group/setDescription', val);
			},
		},
		status: {
			get() {
				return this.$store.state.group.model.status;
			},
			set(val) {
				this.$store.commit('group/setStatus', val);
			},
		},
		price: {
			get() {
				return this.$store.state.group.model.value.price;
			},
			set(val) {
				this.$store.commit('group/setPrice', val);
			},
		},
		price_for_students: {
			get() {
				return this.$store.state.group.model.value.price_for_students;
			},
			set(val) {
				this.$store.commit('group/setPriceForStudents', val);
			},
		},
		category: {
			get() {
				return this.$store.state.group.model.category;
			},
			set(val) {
				this.$store.commit('group/setCategory', val);
			},
		},
		start_at: {
			get() {
        return this.$store.state.group.model.value.start_at;
			},
			set(val) {
				this.$store.commit('group/setStartAt', val);
			},
		},
		exam_date: {
			get() {
				return this.$store.state.group.model.value.exam_date;
			},
			set(val) {
				this.$store.commit('group/setExamDate', val);
			},
		},
		timetable: {
			get() {
				return this.$store.state.group.model.value.timetable;
			},
			set(value) {
				this.$store.commit('group/setTimetable', value);
			},
		},
		hours_start_at: {
			get() {
				return this.$store.state.group.model.value.hours_start_at;
			},
			set(val) {
				this.$store.commit('group/setHoursStartAt', val);
			},
		},
		hours_finish_at: {
			get() {
				return this.$store.state.group.model.value.hours_finish_at;
			},
			set(val) {
				this.$store.commit('group/setHoursFinishAt', val);
			},
		},

		...mapState({
			validationErrors: state => state.group.model.validationErrors,
			modalShow: state => state.group.modalShow,
			modalMode: state => state.group.modalMode,
			constants: state => state.group.constants,
		}),
		...mapGetters('group',[
			'modalModeLabel'
		]),
	},
	methods: {
		async saveGroup() {
      let allValid = await this.$validator.validateAll();
			if (allValid) {
				this.$store.dispatch('group/save');
      }
		},
		...mapActions('group', {
			deleteGroup: 'delete',
		}),
		...mapMutations('group', [
			'closeModal',
			'showCreateModal'
		])
	},
};
</script>
