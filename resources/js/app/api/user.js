import axios from 'axios';
import C from './constants';

export default {
	signup: (user) => axios.post(C.REST.auth.signup, user),
	signupPersonal: (user) => axios.post(C.REST.auth.signupPersonal, user),
	login: (user) => axios.post(C.REST.auth.login, user),
	logout: (user) => axios.get(C.REST.auth.logout),
};
