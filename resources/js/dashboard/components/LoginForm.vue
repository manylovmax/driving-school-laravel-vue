<template>
  <div class="site-login">
    <div class="text-center">
      <h3>Вход</h3>
    </div>
    <div class="card card--dark p-3">
      <form
        class="form"
        @submit.prevent="beforeLogin">
        <div class="form-group">
          <label for="exampleInputEmail1">Email</label>
          <input
            v-validate="'required'"
            v-model.trim="email"
            :class="{'is-invalid': errors.has('email')}"
            name="email"
            type="email"
            class="form-control"
            aria-describedby="emailHelp">
          <div class="invalid-feedback">
            {{ errors.first('email') }}
          </div>
        </div>
        <div class="form-group">
          <label for="exampleInputEmail1">Пароль</label>
          <input
            v-validate="'required|min:2|max:255'"
            v-model="password"
            :class="{'is-invalid': errors.has('password')}"
            name="password"
            type="password"
            class="form-control"
            aria-describedby="emailHelp">
          <div class="invalid-feedback">
            {{ errors.first('password') }}
          </div>
        </div>
        <div class="text-right">
          <a
            href="#"
            @click="passReset"
          >Забыли пароль?</a>
          <button
            class="btn btn-primary"
          >Войти</button>
        </div>
      </form>
    </div>
  </div>
</template>
<script>
import { mapState, mapActions, mapMutations, mapGetters } from 'vuex';

export default {
	computed: {
		email: {
			get() {
				return this.$store.state.user.model.value.email;
			},
			set(val) {
				this.$store.commit('user/setEmail', val);
			},
		},
		password: {
			get() {
				return this.$store.state.user.model.value.password;
			},
			set(val) {
				this.$store.commit('user/setPassword', val);
			},
		},
	},
	methods: {
		async beforeLogin () {
			const allValid = await this.$validator.validateAll();
			if (allValid) {
				const loggedIn = await this.$store.dispatch('user/login');
				if (loggedIn) {
					this.$router.push(this.$route.query.redirect || '/');
				}
			}
		},
		async passReset() {
			if (await this.$validator.validate('email')) {
				await this.$store.dispatch('user/passReset');
			  // this.$store.commit('user/passReset');
			}
		}
	}
};
</script>
