import Vue from 'vue';
import Vuex from 'vuex';
import user from './modules/user';
import group from './modules/group';
import personalTraining from './modules/personalTraining';
import actions from './actions';
import mutations from './mutations';
import getters from './getters';
// import createLogger from '../../../src/plugins/logger';

Vue.use(Vuex);

const debug = process.env.NODE_ENV !== 'production';

const store = new Vuex.Store({
	modules: {
		user,
		group,
		personalTraining
	},
	strict: debug,
	actions,
	mutations,
	getters,
	// plugins: debug ? [createLogger()] : []
});


// Subscribe to store updates
store.subscribe((mutation, state) => {
	// Store the state object as a JSON string
	localStorage.setItem('store', JSON.stringify(state));
});

export default store;
