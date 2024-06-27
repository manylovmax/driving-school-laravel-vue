<template>
  <div>
    <Message />
    <PersonalTrainingModal />
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <h3>Персональные группы</h3>

        </div>
        <div class="col-lg-8 text-right">
          <SearchInput
            :value="query"
            @input="search" />
          <span
            class="btn-add btn-add--outline"
            @click="showCreateModal">
            +
          </span>
        </div>
      </div>
      <div class="row justify-content-center">
        <div
          v-for="group in groups"
          :key="group.id"
          class="col-lg-4">
          <PersonalTrainingCard
            :key="group.id"
            :group="group"
            @update="showUpdateModal"
          />
        </div>
      </div>
    </div>
</div></template>

<script>
// import TableComponent from './DataTable/TableComponent';
import PersonalTrainingModal from '../components/PersonalTrainingModal';
import PersonalTrainingCard from '../components/PersonalTrainingCard';
import Message from '../components/Message';
import SearchInput from '../components/SearchInput';
import Paginator from '../components/Paginator';
import { mapState, mapMutations, mapActions } from 'vuex';
import debounce from '~/resources/js/helpers/debounce';

export default {
	components: {
		PersonalTrainingCard,
		PersonalTrainingModal,
		Message,
		SearchInput,
		Paginator,
	},
	computed: mapState({
		groups: state => state.personalTraining.all,
		from: state => state.personalTraining.paginator.from,
		to: state => state.personalTraining.paginator.to,
		total: state => state.personalTraining.paginator.total,
		current_page: state => state.personalTraining.paginator.current_page,
		last_page: state => state.personalTraining.paginator.last_page,
		query: state => state.personalTraining.search.query,
		groupLabels: state => state.personalTraining.groupLabels,
		groupStatuses: state => state.personalTraining.groupStatuses,
	}),
	created () {
		this.$store.dispatch('personalTraining/getPage', 1);
	},
	methods: {
		search: function (query) {
			this.$store.commit('personalTraining/setSearchQuery', query);
			this._search();
		},
		_search: debounce(
			function () {this.$store.dispatch('personalTraining/search');},
			// this.$store.state.user.search.debounceTimeout
			1000
		),
		...mapMutations('personalTraining', [
			'showCreateModal',
			'showUpdateModal',
		]),
		...mapActions('user', [
			'goToNextPage',
			'goToPrevPage',
		]),
	}
};
</script>
