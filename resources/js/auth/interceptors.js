import axios from 'axios';
import ls from '../helpers/localStorage';
import store from '../dashboard/store';

export default function setup() {
  // A request interceptor
  axios.interceptors.request.use(function (config) {
    const access = ls.get('access');
    if (access) {
      const {
        access_token
      } = access;
      if (access_token) {
        config.headers.Authorization = `Bearer ${access_token}`;
      }
    }
    return config;
  }, function (error) {
    return Promise.reject(error);
  });
  // A response interceptor
  axios.interceptors.response.use(
    (response) => response
    // {
      // return response.text().then(text => {
      //   const data = text && JSON.parse(text);
      //   return data;
      // })
    // }
    ,
    (error) => {
      if (error.response.status === 401) {
        // auto logout if 401 response returned from api
        store.dispatch('user/logout');
        location.reload(true);
      }
      return Promise.reject(error);
    }
  );

}
