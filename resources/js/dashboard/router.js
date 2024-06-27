import Vue from 'vue';
import Router from 'vue-router';
import Login from './views/Login.vue';
import store from './store';

Vue.use(Router);

let router = new Router({
	mode: 'history',
	routes: [
		{
			path: '/dashboard/login',
			name: 'login',
      component: Login,
      meta: { requiresAuth: false },
		},
		// {
		// 	path: '/dashboard/',
		// 	name: 'home',
		//   component: () => import(/* webpackChunkName: "group" */ './views/Home.vue'),
    //   meta: { requiresAuth: true },
		// },
		{ path: '/dashboard', redirect: '/dashboard/user' },
		{
		  path: '/dashboard/user',
		  name: 'user',
		  // route level code-splitting
		  // this generates a separate chunk (group.[hash].js) for this route
		  // which is lazy-loaded when the route is visited.
		  component: () => import(/* webpackChunkName: "group" */ './views/User.vue'),
      meta: { requiresAuth: true },
		},
		{
		  path: '/dashboard/group',
		  name: 'group',
		  // route level code-splitting
		  // this generates a separate chunk (group.[hash].js) for this route
		  // which is lazy-loaded when the route is visited.
		  component: () => import(/* webpackChunkName: "group" */ './views/Group.vue'),
      meta: { requiresAuth: true },
		},
		{
		  path: '/dashboard/personal-training',
		  name: 'personalTraining',
		  // route level code-splitting
		  // this generates a separate chunk (group.[hash].js) for this route
		  // which is lazy-loaded when the route is visited.
		  component: () => import(/* webpackChunkName: "group" */ './views/PersonalTraining.vue'),
      meta: { requiresAuth: true },
		},
	]
});

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
    // this route requires auth, check if logged in
    // if not, redirect to login page.
    if (!store.getters.isAuthenticated) {
      next({
        path: '/dashboard/login',
        query: { redirect: to.fullPath }
      })
    } else {
      next()
    }
  } else {
    next() // make sure to always call next()!
  }
})

export default router;
