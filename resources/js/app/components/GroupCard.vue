<template>
  <div
    class="card text-center"
  >
    <div class="card__header">
      <div class="card__indicator-badge">
        <div :class="group.status.class" />
        <!-- <span class="text-muted">{{ group.status.value }}</span> -->
      </div>
      <h4 class="card__title">{{ group.name }}</h4>
      <h6 class="card__description text-muted">{{ group.description || "" }}</h6>
    </div>
    <div class="card__body">
      <ul class="list-group list-group-flush">
        <li class="list-group-item"><div class="text-muted">cтоимость обучения</div>
          <p>{{ group.price }} рублей</p>
          <p class="text-muted">{{ group.price_for_students }} рублей - для студентов</p>
        </li>
        <li class="list-group-item"><div class="text-muted">дни занятий</div>{{ timetable }}</li>
        <li class="list-group-item"><div class="text-muted">часы обучения</div>{{ group.hours_start_at }} - {{ group.hours_finish_at }}</li>
        <li class="list-group-item"><div class="text-muted">начало обучения</div>{{ start_at }}</li>
      </ul>
    </div>
    <div class="card__footer">
      <div
        class="btn btn--gray"
        @click="select(group.id)">выбрать</div>
    </div>
  </div>
</template>
<script>
import moment from 'moment';

export default {
  computed: {
    timetable: function () {
      return typeof Array.isArray(this.group.timetable) ? this.group.timetable.join(', ') : this.group.timetable;
    },
    start_at: function() {
      return this.group.start_at instanceof Date ? moment(this.group.start_at).format('DD/MM/YYYY') : '';
    }
  },
	props: {
		group: { type: Object, default: () => [] },
	},
	methods: {
		select: function(id) {
			this.$emit('select', id);
		},
	}
};
</script>
