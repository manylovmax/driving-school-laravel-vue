<template>
  <div id="app">
    <!-- <Nav>
      <template slot="title">
        <small>ВОЕНМЕХ</small> АВТОШКОЛА
      </template>
      <template slot="links">
        <router-link
          :to="{name: 'home'}"
          tag="li"
          class="nav-item"
          active-class="active"
        >
          <a class="nav-link">Главная</a>
        </router-link>
        <router-link
          :to="{name: 'login'}"
          tag="li"
          class="nav-item"
          active-class="active"
        >
          <a class="nav-link">Вход</a>
        </router-link>
      </template>
    </Nav> -->
    <transition
      name="fade"
      mode="out-in"
      appear>
      <router-view/>
    </transition>
    <Footer />
  </div>
</template>

<script>
import Nav from './components/Nav.vue';
import Footer from './components/Footer.vue';

export default {
	components: {
		Nav,
		Footer,
	}
};
</script>

