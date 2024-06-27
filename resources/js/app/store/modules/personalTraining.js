import API from '../../api/personalTraining';
import C from './constants';

// initial state
const state = {
	all: [],
	modalShow: false,
	modalMode: null,
	errors: [],
	constants: C,
	message: {
		text: 'Default text',
		type: C.message.type.OK,
		show: false,
		image: null,
	},
	search: {
		query: '',
		debounceTimeout: 500,
	},
	paginator: {
		from: 0,
		to: 0,
		total: 0,
		current_page: 0,
		last_page: 0,
	},
	groupLabels: C.groupLabels,
	groupStatuses: C.groupStatuses,
};

// getters
const getters = {
	modalModeLabel: (state, getters, rootState) => {
		switch (state.modalMode) {
		case C.mode.CREATE:
			return 'Добавить';
		case C.mode.UPDATE:
			return 'Редактировать';
		}
	}
};

// actions
const actions = {
	async getPage({
		commit,
		dispatch,
		state
	}, page) {
		try {
			const {
				data,
				status
			} = await API.getPage({
				page,
				q: state.search.query,
			});
			if (status == 200) {
				commit('setAll', data.data.map((model) => ({
					...model,
					start_at: model.start_at.split('-').reverse().join('/'),
					hours_start_at: model.hours_start_at.slice(0,5),
					hours_finish_at: model.hours_finish_at.slice(0,5),
					timetable: JSON.parse(model.timetable),
					status: C.groupStatuses.find(item => item.key == model.status),
					category: C.groupCategories.find(item => item.key == model.category),
				})));
				commit('setPaginator', data.meta);
			}
		} catch (error) {
			mutations.addErrors(error);
		}
	},
	// async getAll({
	// 	commit
	// }) {
	// 	try {
	// 		const {
	// 			data,
	// 			status
	// 		} = await API.getAll();
	// 		if (status == 200) {
	// 			commit('setAll', data.data.map((model) => ({
	// 				timetable: JSON.parse(model.timetable),
	// 				...model,
	// 			}))
	// 			);
	// 		}
	// 	} catch (error) {
	// 		mutations.addErrors(error);
	// 	}
	// },

	showMessageOK({commit}, message) {
		commit('showMessageOK', message);
		setTimeout(() => commit('closeMessage'), 1500);
	},
	showMessageError({commit}, message) {
		commit('showMessageError', message);
		setTimeout(() => commit('closeMessage'), 1500);
	},
	async goToNextPage({
		commit,
		dispatch,
		state
	}) {
		try {
			const nextPageNumber = state.paginator.current_page + 1;
			if (nextPageNumber > state.paginator.last_page) {
				throw new Error('Paginator: out of range');
			}
			const {
				data,
				status
			} = await API.getPage({
				page: nextPageNumber,
				q: state.search.query,
			});
			if (status == 200) {
				commit('setAll', data.data);
				commit('setPaginator', data.meta);
			}
		} catch (error) {
			dispatch('showMessageError');
			commit('addErrors', error);
		}
	},
	async goToPrevPage({
		commit,
		dispatch,
		state
	}) {
		try {
			const prevPageNumber = state.paginator.current_page - 1;
			if (prevPageNumber < 1) {
				throw new Error('Paginator: out of range');
			}
			const {
				data,
				status
			} = await API.getPage({
				page: prevPageNumber,
				q: state.search.query,
			});
			if (status == 200) {
				commit('setAll', data.data);
				commit('setPaginator', data.meta);
			}
		} catch (error) {
			dispatch('showMessageError');
			commit('addErrors', error);
		}
	},
};

// mutations
const mutations = {
	setAll(state, groups) {
		state.all = groups;
	},
	setModel(state, value) {
		state.model.value = value;
	},
	setName(state, value) {
		state.model.value.name = value;
	},
	setStatus(state, value) {
		state.model.value.status = value;
	},
	setPrice(state, value) {
		state.model.value.price = value;
	},
	setPriceForStudents(state, value) {
		state.model.value.price_for_students = value;
	},
	setCategory(state, value) {
		state.model.value.category = value;
	},
	setStartAt(state, value) {
		state.model.value.start_at = value;
	},
	setExamDate(state, value) {
		state.model.value.exam_date = value;
	},
	setTimetable(state, value) {
		state.model.value.timetable = value;
	},
	setHoursStartAt(state, value) {
		state.model.value.hours_start_at = value;
	},
	setHoursFinishAt(state, value) {
		state.model.value.hours_finish_at = value;
	},
	addErrors(state, e) {
		state.errors.push(e);
	},
	showUpdateModal(state, id) {
		state.model.value = { ...state.all.find(model => model.id == id)};
		state.modalMode = C.mode.UPDATE;
		state.modalShow = true;
	},
	showCreateModal(state) {
		state.model.value = C.defaultGroup;
		state.modalMode = C.mode.CREATE;
		state.modalShow = true;
	},
	setModelValue(state, id) {
		state.model.value = { ...state.all.find(model => model.id == id)
		};
	},
	showModal(state, show) {
		state.modalShow = show;
	},
	closeModal(state) {
		state.modalShow = false;
		state.model.validationErrors = [];
	},
	showMessageOK(state, message) {
		state.message = {
			text: message,
			type: C.message.type.OK,
			show: true,
		};
	},
	showMessageError(state, message) {
		state.message = {
			text: message,
			type: C.message.type.ERROR,
			show: true,
		};
	},
	closeMessage(state) {
		state.message = {
			text: '',
			type: null,
			show: false,
		};
	},
	setPaginator(state, paginator) {
		state.paginator.from = paginator.from;
		state.paginator.to = paginator.to;
		state.paginator.total = paginator.total;
		state.paginator.current_page = paginator.current_page;
		state.paginator.last_page = paginator.last_page;
	},
	setSearchQuery(state, query) {
		state.search.query = query;
	},
};

export default {
	namespaced: true,
	state,
	getters,
	actions,
	mutations
};
