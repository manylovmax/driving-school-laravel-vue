<template>
  <section class="bg-light">
    <div class="container">
      <div class="row justify-content-md-center">
        <div
          v-for="group in groups"
          :key="group.id"
          class="col-lg-4 col-md-6">
          <GroupCard
            :key="group.id"
            :group="group"
            @select="selectGroup(group.id)"
          />
        </div>
      </div>
    </div>
    <UserModal />
    <Message />
  </section>
</template>
<script>

import GroupCard from '../components/GroupCard';
import UserModal from '../components/UserModal';
import Message from '../components/Message';
import { mapState, mapMutations, mapActions } from 'vuex';

export default {
	components: {
		GroupCard,
		UserModal,
		Message,
	},
	computed: mapState({
		groups: state => state.group.all,
	}),
	created () {
		this.$store.dispatch('group/getPage', 1);
	},
	methods: {
		selectGroup: function(group_id) {
			this.$store.commit('user/setGroup', group_id);
			this.$store.commit('user/showCreateModal');
		},
		...mapActions('user', [
			'signUp',
		]),
	}
};
</script>
