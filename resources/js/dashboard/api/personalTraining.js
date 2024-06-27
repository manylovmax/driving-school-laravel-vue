import axios from 'axios';
import C from './constants';

export default {
	getAll: () => axios.get(`${C.REST.personalTraining}/all`),
	getPage: (params) => axios.get(C.REST.personalTraining, {params}),
	get: (groupId) => axios.get(`${C.REST.personalTraining}/${groupId}`),
	create: (group) => axios.post(C.REST.personalTraining, group),
	update: (group) => axios.put(`${C.REST.personalTraining}/${group.id}`, group),
	delete: (groupId) => axios.delete(`${C.REST.personalTraining}/${groupId}`),
};
