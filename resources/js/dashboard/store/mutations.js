import {version} from '~/package.json';

export default {
	saveToLocalStorage(state) {
		// Store the state object as a JSON string
		localStorage.setItem('store', JSON.stringify(state));
	},
	initialiseStore(state) {
		if(localStorage.getItem('store')) {
			let store = JSON.parse(localStorage.getItem('store'));
			if(store.version == version) {
				this.replaceState(
					Object.assign(state, store)
				);
			} else {
				state.version = version;
			}
		}
	}
};
