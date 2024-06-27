export default {
	set(key, value) {
		localStorage.setItem(key, JSON.stringify(value));
	},
	get(key) {
		let value = localStorage.getItem(key);
		if(value) {
			value = JSON.parse(value);
			return value;
		}
	},
	remove(key) {
		let value = localStorage.getItem(key);
		if(value) {
			localStorage.removeItem(key);
		}
	},
};
