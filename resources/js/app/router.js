import Vue from 'vue';
import Router from 'vue-router';
import Home from './views/Home.vue';

Vue.use(Router);

export default new Router({
	mode: 'history',
	routes: [
    {
      path: '/',
      redirect: 'index'
    },
		{
			path: '/index',
			name: 'home',
			component: Home
		},
		// {
		//   path: '/sign-up',
		//   name: 'sign-up',
		//   // route level code-splitting
		//   // this generates a separate chunk (group.[hash].js) for this route
		//   // which is lazy-loaded when the route is visited.
		//   component: () => import(/* webpackChunkName: "group" */ './views/SignUp.vue')
		// },
		{
		  path: '/login',
		  name: 'login',
		  // route level code-splitting
		  // this generates a separate chunk (group.[hash].js) for this route
		  // which is lazy-loaded when the route is visited.
		  component: () => import(/* webpackChunkName: "group" */ './views/Login.vue')
    },
    { path: "*", redirect: '404'},
	]
});
