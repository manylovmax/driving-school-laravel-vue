<template>
  <section>
    <div class="container">
      <div class="row justify-content-md-center">
        <div class="col-md-4 mt-3">
          <LoginForm />
        </div>
      </div>
    </div>
    <GoogleReCaptcha
      :page="'dashboard/login'"/>
  </section>
</template>
<script>

import LoginForm from '../components/LoginForm';
import GoogleReCaptcha from '~/resources/js/sharedComponents/GoogleReCaptcha';

export default {
	components: {
		LoginForm,
		GoogleReCaptcha,
	},
};
</script>
