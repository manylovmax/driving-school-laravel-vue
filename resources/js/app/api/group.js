import axios from 'axios';
import C from './constants';

export default {
	getPage: (params) => axios.get(C.REST.group, {params}),
};
