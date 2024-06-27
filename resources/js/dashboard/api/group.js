import axios from 'axios';
import C from './constants';

export default {
	getAll: () => axios.get(`${C.REST.group}/all`),
	getPage: (params) => axios.get(C.REST.group, {params}),
	get: (groupId) => axios.get(`${C.REST.group}/${groupId}`),
	create: (group) => axios.post(C.REST.group, group),
	update: (group) => axios.put(`${C.REST.group}/${group.id}`, group),
	delete: (groupId) => axios.delete(`${C.REST.group}/${groupId}`),
};
