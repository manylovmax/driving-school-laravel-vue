<template>
  <section class="bg-light">
    <div class="container">
      <div class="row justify-content-md-center">
        <div class="col-md-4 mt-3">
          <LoginForm />
        </div>
      </div>
    </div>
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
