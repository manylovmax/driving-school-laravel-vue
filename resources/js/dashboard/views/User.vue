<template>
  <div>
    <Message />
    <UserModal />
    <div class="container-fluid mt-4">
      <div class="row mx-0">
        <div class="col-lg-5">
          <h3>Записавшиеся</h3>
          <Paginator
            :v-if="total"
            :from="from"
            :to="to"
            :total="total"
            :current_page="current_page"
            :last_page="last_page"
            @goToNextPage="goToNextPage"
            @goToPrevPage="goToPrevPage"
          />
        </div>
        <div class="col-lg-3">
          <multiselect
            class="filter-dropdown"
            label="name"
            v-model="group"
            track-by="name"
            :options="groups"
            :allow-empty="true"
          />

          <ExportLink :link="exportLink" :show="exportLink.length > 0">Группа в таблице XLSX</ExportLink>
          <br v-show="exportLink.length == 0" />
        </div>
        <div class="col-lg-1">
          <BinButton :label="binLabel" @triggerBin="triggerBin" />
        </div>
        <div class="col-lg-3 text-right">
          <SearchInput :value="query" @input="search" />
          <span class="btn-add btn-add--outline" @click="showCreateModal">Добавить запись</span>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <TableComponent
            :objects="userWGroupNames"
            :labels="userLabels"
            @update="showUpdateModal"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// import TableComponent from './DataTable/TableComponent';
import Multiselect from "vue-multiselect";
import UserModal from "../components/UserModal";
import Message from "../components/Message";
import SearchInput from "../components/SearchInput";
import Paginator from "../components/Paginator";
import TableComponent from "../components/DataTable/TableComponent";
import ExportLink from "../components/ExportLink";
import BinButton from "../components/BinButton";
import { mapState, mapMutations, mapActions } from "vuex";
import debounce from "~/resources/js/helpers/debounce";

export default {
  components: {
    TableComponent,
    UserModal,
    Multiselect,
    Message,
    SearchInput,
    Paginator,
    ExportLink,
    BinButton
  },
  computed: {
    userWGroupNames: function() {
      let getGroupName = function(group_id, groups) {
          let group = groups.find(group => group_id == group.id);
          return group ? group.name : 'данные отсутствуют';
      }
      let groups = this.$store.state.group.all;

      return this.$store.state.user.all.map(user => ({
        ...user,
        group: getGroupName(user.group_id, groups)
      }));
    },
    ...mapState({
      users: state => state.user.all,
      groups: state => state.group.all,
      from: state => state.user.paginator.from,
      to: state => state.user.paginator.to,
      total: state => state.user.paginator.total,
      current_page: state => state.user.paginator.current_page,
      last_page: state => state.user.paginator.last_page,
      query: state => state.user.search.query,
      binFlag: state => state.user.search.binFlag,
      binLabel: state => state.user.search.binLabel,
      exportLink: state => state.user.search.exportLink,
      userLabels: state => state.user.userLabels
    }),
    group: {
      get() {
        return this.$store.state.user.search.group;
      },
      set(val) {
        // this.$store.commit('user/setFilterByGroup', val);
        this.$store.dispatch("user/filterByGroup", val);
      }
    }
  },
  // watch: {
  // 	// call again the method if the route changes
  // 	'$route': 'fetchData'
  // },
  created() {
    this.$store.dispatch("user/getPage");
    this.$store.dispatch("group/getAll");
  },
  methods: {
    search: function(query) {
      this.$store.commit("user/setSearchQuery", query);
      this._search();
    },
    _search: debounce(
      function() {
        this.$store.dispatch("user/search");
      },
      // this.$store.state.user.search.debounceTimeout
      1000
    ),
    ...mapMutations("user", ["showCreateModal", "showUpdateModal"]),
    ...mapActions("user", ["goToNextPage", "goToPrevPage", "triggerBin"])
  }
};
</script>
