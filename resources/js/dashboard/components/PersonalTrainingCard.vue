<template>
  <div
    class="card text-center"
    @click="update(group.id)"
  >
    <div class="card__header">
      <div
        :class="group.status.class"
      />
      <h4 class="card__title">{{ group.name }}</h4>
      <h6 class="card__description text-muted">{{ group.description }}</h6>
    </div>
    <div class="card__body">
      <ul class="list-group list-group-flush">
        <li class="list-group-item"><div class="text-muted">cтоимость обучения</div>
          <p>{{ group.price }} рублей</p>
          <p class="text-muted">{{ group.price_for_students }} рублей - для студентов</p>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
export default {
	props: {
		group: { type: Object, default: () => [] },
	},
	methods: {
		update: function(id) {
			this.$emit('update', id);
		},
	}
};
</script>
