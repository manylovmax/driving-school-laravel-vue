<template>
  <div>
    <NewUserModal
      :show="showUserModal"
      @close="showUserModal=false"
      @userSaved="userSaved"
    />
    <NewGroupModal
      :show="showGroupModal"
      @close="showGroupModal=false"/>
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="card">
            <div class="card-header">
              <h3>Записавшиеся</h3>
              <span
                class="btn-add float-right"
                @click="showUserModal=true">
                +
              </span>
            </div>
            <div class="card-body">
              <TableComponent :objects="users" />
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="card">
            <div class="card-header">
              <h3>Группы</h3>
              <span
                class="btn-add float-right"
                @click="showGroupModal=true">
                +
              </span>
            </div>
            <div class="card-body">
              <TableComponent :objects="groups" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// import TableComponent from './DataTable/TableComponent';
import NewUserModal from './NewUserModal';
import NewGroupModal from './NewGroupModal';
import TableComponent from './DataTable/TableComponent';
import C from '../constants';

export default {
	name: 'DashboardComponent',
	components: {
		TableComponent,
		NewUserModal,
		NewGroupModal
	},
	data () {
		return {
			showUserModal: false,
			showGroupModal: false,
			users: null,
			groups: null,
		};
	},
	mounted: function () {
		axios.get(C.api.user)
			.then(reposnse => {
				this.users = reposnse.data.data;
			})
			.catch(e => { this.errors.push(e); });
		axios.get(C.api.group)
			.then(reposnse => {
				this.groups = reposnse.data.data;
			})
			.catch(e => { this.errors.push(e); });
	},
	methods: {
		userSaved(response) {
			console.log('userSaved fired');
		},
	},
};
</script>
