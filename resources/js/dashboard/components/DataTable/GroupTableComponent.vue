<template>
  <div v-if="labels" >
    <div class="data-table">
      <div class="data-table__head">
        <div class="data-table__head-row">
          <div class="data-table__head-col  data-table__head-col--indicator"/>
          <div
            v-for="(vaule, key) in labels"
            :key="key"
            class="data-table__head-col">{{ vaule }}
          </div>
        </div>
      </div>
      <div class="data-table__body">
        <div
          v-for="object in objects"
          :key="object.id"
          class="data-table__body-row"
          @click="update(object.id)">
          <div class="data-table__body-col data-table__body-col--indicator">
            <div
              :class="object.status.class"
            />
          </div>
          <div
            v-for="(value, key) in labels"
            :key="key"
            class="data-table__body-col"
          >{{ object[key] }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
	props: {
		objects: { type: Array, default: () => [] },
		labels: { type: Object, default: () => null },
		statuses: { type: Array, default: () => [] },
		// rows: { type: Array, default: () => [] },
		// columns: { type: Array, default: () =>[] },

	},
	methods: {
		update: function(id) {
			this.$emit('update', id);
		},
		getIndicatorClass: function (status) {
			return this.statuses.find(item => item.key == status).class;//select class from statuses where key = status
		}
	}
};
</script>
