<template>
  <div id="app">
    <Navbar
      v-show="login"
    >
      <!-- <router-link
        :to="{name: 'home'}"
        tag="li"
        class="nav-item"
        active-class="active"
      >
        <a class="nav-link">Главная</a>
      </router-link> -->
      <router-link
        :to="{name: 'user'}"
        tag="li"
        class="nav-item"
        active-class="active"
      >
        <a class="nav-link">Записавшиеся</a>
      </router-link>
      <router-link
        :to="{name: 'group'}"
        tag="li"
        class="nav-item"
        active-class="active"
      >
        <a class="nav-link">Группы</a>
      </router-link>
      <!-- <router-link
        :to="{name: 'personalTraining'}"
        tag="li"
        class="nav-item"
        active-class="active"
      >
        <a class="nav-link">Перс. группы</a>
      </router-link> -->
      <!-- <router-link
        :to="{name: 'logout'}"
        tag="li"
        class="nav-item"
        active-class="active"
      >
        <a @click="logout" class="nav-link">Logout</a>
      </router-link> -->

      <li class="nav-item">
        <a @click="logout" href="#" class="nav-link">Logout</a>
      </li>

    </Navbar>
    <transition
      name="fade"
      mode="out-in"
      appear
    >
      <router-view/>
    </transition>
  </div>
</template>

<script>
import Navbar from './components/Navbar.vue';
import { mapState, mapActions, mapMutations, mapGetters } from 'vuex';

export default {
	components: {
		Navbar
	},
	computed: {
		...mapState({
			login: state => state.user.login,
		}),
  },
  methods: {
    ...mapActions('user', [
      'logout'
    ])
  },
};
</script>

