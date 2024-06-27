export default {
	mode: {
		SIGNUP: 'signup',
		SIGNUP_PERSONAL: 'signupPersonal',
	},
	message: {
		type: {
			OK: 'Готово',
			WARNING: 'Внимание',
			ERROR: 'Ошибка',
		},
		image: {
			OK: 'Готово',
			WARNING: 'Внимание',
			ERROR: 'Ошибка',
		}
	},
	groupStatuses: [{
		key: 1,
		value: 'Набирается',
		class: 'indicator indicator--green',
	},
	{
		key: 2,
		value: 'Обучается',
		class: 'indicator indicator--yellow',
	},
	{
		key: 3,
		value: 'Закрыта',
		class: 'indicator indicator--red',
	},
	],
	groupCategories: [{
		key: 1,
		value: 'B'
	}, {
		key: 2,
		value: 'BC'
	}],
	get defaultUser() {
		return {
			name: null,
			surname: null,
			phone: null,
			email: null,
			group_id: null,
			password: null,
		};
	},
};
