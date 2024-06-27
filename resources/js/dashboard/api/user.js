import axios from 'axios';
import C from './constants';

export default {
	login: (user) => axios.post(C.REST.auth.login, user),
	logout: (user) => axios.get(C.REST.auth.logout),
	getAll: () => axios.get(C.REST.user),
	getPage: (params) => axios.get(C.REST.user, {params}),
	create: (user) => axios.post(C.REST.user, user),
	update: (user) => axios.put(`${C.REST.user}/${user.id}`, user),
	delete: (userId) => axios.delete(`${C.REST.user}/${userId}`),
};
