<template>
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <Clients/>
      </div>
      <div class="col-md-6">
        <AuthorizedClients/>
      </div>
      <div class="col-md-6">
        <PersonalAccessTokens/>
      </div>
    </div>
  </div>
</template>
<script>
import AuthorizedClients from '../components/passport/AuthorizedClients';
import Clients from '../components/passport/Clients';
import PersonalAccessTokens from '../components/passport/PersonalAccessTokens';

export default {
	components: {
		AuthorizedClients,
		Clients,
		PersonalAccessTokens,
	}
};

</script>
