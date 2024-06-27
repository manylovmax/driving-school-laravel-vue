<template>
  <div>
    <Message />
    <GroupModal />
    <div class="container mt-4">
      <div class="row mb-4">
        <div class="col-lg-4">
          <h3>Группы</h3>
        </div>
        <div class="col-lg-8 text-right">
          <SearchInput :value="query" @input="search" />
          <span class="btn-add btn-add--outline" @click="showCreateModal">Добавить запись</span>
        </div>
      </div>
      <div class="row justify-content-center">
        <div v-for="group in groups" :key="group.id" class="col-lg-4">
          <GroupCard :key="group.id" :group="group" @update="showUpdateModal" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// import TableComponent from './DataTable/TableComponent';
import GroupModal from "../components/GroupModal";
import Message from "../components/Message";
import GroupCard from "../components/GroupCard";
import SearchInput from "../components/SearchInput";
import Paginator from "../components/Paginator";
import { mapState, mapMutations, mapActions } from "vuex";
import debounce from "~/resources/js/helpers/debounce";

export default {
  components: {
    GroupCard,
    GroupModal,
    Message,
    SearchInput,
    Paginator
  },
  computed: mapState({
    groups: state => state.group.all,
    from: state => state.group.paginator.from,
    to: state => state.group.paginator.to,
    total: state => state.group.paginator.total,
    current_page: state => state.group.paginator.current_page,
    last_page: state => state.group.paginator.last_page,
    query: state => state.group.search.query,
    groupLabels: state => state.group.groupLabels,
    groupStatuses: state => state.group.groupStatuses
  }),
  created() {
    this.$store.dispatch("group/getPage", 1);
  },
  methods: {
    search: function(query) {
      this.$store.commit("group/setSearchQuery", query);
      this._search();
    },
    _search: debounce(
      function() {
        this.$store.dispatch("group/search");
      },
      // this.$store.state.user.search.debounceTimeout
      1000
    ),
    ...mapMutations("group", ["showCreateModal", "showUpdateModal"]),
    ...mapActions("user", ["goToNextPage", "goToPrevPage"])
  }
};
</script>
