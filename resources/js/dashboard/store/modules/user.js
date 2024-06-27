import API from '../../api/user';
import C from './constants';
import {
  Store
} from 'vuex';
import ls from '~/resources/js/helpers/localStorage';

// initial state
const state = {
  all: [],
  modalShow: false,
  modalMode: null,
  query: null,
  errors: [],
  constants: C,
  login: false,
  model: {
    value: C.defaultUser,
    required: ['name', 'phone', 'group_id'],
    validationErrors: [],
  },
  message: {
    text: 'Default text',
    type: C.message.type.OK,
    show: false,
    image: null,
  },
  search: {
    query: '',
    debounceTimeout: 500,
    group: null,
    exportLink: '',
    binFlag: false,
    binLabel: "В корзину",
  },
  paginator: {
    from: 0,
    to: 0,
    total: 0,
    current_page: 0,
    last_page: 0,
  },
  userLabels: C.userLabels,
};

// getters
const getters = {
  modalModeLabel: (state, getters, rootState) => {
    switch (state.modalMode) {
      case C.mode.CREATE:
        return 'Добавить';
      case C.mode.UPDATE:
        return 'Редактировать';
    }
  }
};

// actions
const actions = {
  async login({
    commit,
    dispatch,
    state
  }) {
    try {
      const {
        data,
        status
      } = await API.login(state.model.value);
      if (status == 200) {
        ls.set('access', data);
        commit('login', true);
        return true;
      }
    } catch (error) {
      dispatch('showMessageError', error);
      commit('addErrors', error);
    }

    return false;
  },
  async logout({
    commit,
    dispatch,
    state
  }) {
    try {
      const {
        data,
        status
      } = await API.logout();
      if (status == 200) {
        ls.remove('access');
        commit('login', false);
        location.reload(true);

        return true;
      }
    } catch (error) {
      dispatch('showMessageError', error);
      commit('addErrors', error);
    }

    return false;
  },
  async getPage({
    commit,
    dispatch,
    state
  }, page) {
    try {
      const {
        data,
        status
      } = await API.getPage({
        page,
        q: state.search.query,
        group_id: state.search.group ? state.search.group.id : null,
      });
      if (status == 200) {
        commit('setAll', data.data);
        commit('setPaginator', data.meta);
      }
    } catch (error) {
      commit('addErrors', error);
    }
  },
  save({
    state,
    getters,
    commit,
    dispatch
  }) {
    switch (state.modalMode) {
      case C.mode.CREATE:
        dispatch('create');
        break;
      case C.mode.UPDATE:
        dispatch('update');
        break;
    }
    commit('closeModal');
  },
  async create({
    commit,
    dispatch,
    state
  }) {
    try {
      const {
        data,
        status
      } = await API.create(state.model.value);
      if (status == 201) {
        dispatch('showMessageOK', 'Учащийся добавлен!');
        dispatch('getPage');
      }
    } catch (error) {
      dispatch('showMessageError', error);
      commit('addErrors', error);
    }
  },
  async update({
    commit,
    dispatch,
    state
  }) {
    try {
      const {
        data,
        status
      } = await API.update(state.model.value);
      if (status == 200) {
        dispatch('showMessageOK', 'Учащийся обновлен!');
        commit('setAll', state.all.map(user => {
          if (user.id === data.data.id) {
            return state.model.value;
          } else {
            return user;
          }
        }));
      }
    } catch (error) {
      dispatch('showMessageError', error);
      commit('addErrors', error);
    }
  },
  async delete({
    commit,
    dispatch,
    state
  }) {
    try {
      if (!state.model.value.id) {
        throw new Error('Please, provide user id');
      }
      const {
        data,
        status
      } = await API.delete(state.model.value.id);
      if (status == 204) {
        dispatch('showMessageOK', 'Учащийся удален!');
        dispatch('getPage');
      }
    } catch (error) {
      dispatch('showMessageError', error);
      commit('addErrors', error);
    }
    commit('closeModal');
  },
  showMessageOK({
    commit
  }, message) {
    commit('showMessageOK', message);
    setTimeout(() => commit('closeMessage'), 1000);
  },
  showMessageError({
    commit
  }, message) {
    commit('showMessageError', message);
    setTimeout(() => commit('closeMessage'), 1000);
  },
  async search({
    commit,
    dispatch,
    state
  }) {
    try {
      const query = state.search.query.trim();

      const {
        data,
        status
      } = await API.getPage({
        page: 1,
        q: query,
        group_id: state.search.group ? state.search.group.id : null,
      });

      if (status == 200) {
        commit('setAll', data.data);
        commit('setPaginator', data.meta);
      }
    } catch (error) {
      dispatch('showMessageError', error);
      commit('addErrors', error);
    }
    commit('closeModal');
  },
  async triggerBin({
    commit,
    dispatch,
    state
  }) {
    try {
      const {
        data,
        status
      } = await API.getPage({
        trashed: !state.search.binFlag
      });
      if (status == 200) {
        commit('triggerBin');
        commit('setGroup', null);
        commit('setAll', data.data);
        commit('setPaginator', data.meta);
        commit('setSearchQuery', null);
      }
    } catch (error) {
      dispatch('showMessageError', error);
      commit('addErrors', error);
    }
  },
  async goToNextPage({
    commit,
    dispatch,
    state
  }) {
    try {
      const nextPageNumber = state.paginator.current_page + 1;
      if (nextPageNumber > state.paginator.last_page) {
        throw new Error('Paginator: out of range');
      }
      const {
        data,
        status
      } = await API.getPage({
        page: nextPageNumber,
        trashed: state.search.binLabel,
        q: state.search.query,
        group_id: state.search.group ? state.search.group.id : null,
      });
      if (status == 200) {
        commit('setAll', data.data);
        commit('setPaginator', data.meta);
      }
    } catch (error) {
      dispatch('showMessageError', error);
      commit('addErrors', error);
    }
  },
  async goToPrevPage({
    commit,
    dispatch,
    state
  }) {
    try {
      const prevPageNumber = state.paginator.current_page - 1;
      if (prevPageNumber < 1) {
        throw new Error('Paginator: out of range');
      }
      const {
        data,
        status
      } = await API.getPage({
        page: prevPageNumber,
        trashed: state.search.binLabel,
        q: state.search.query,
        group_id: state.search.group ? state.search.group.id : null,
      });
      if (status == 200) {
        commit('setAll', data.data);
        commit('setPaginator', data.meta);
      }
    } catch (error) {
      dispatch('showMessageError', error);
      commit('addErrors', error);
    }
  },
  async filterByGroup({
    commit,
    dispatch,
    state
  }, group) {
    try {
      const {
        data,
        status
      } = await API.getPage({
        page: 1,
        q: state.search.query,
        group_id: group ? group.id : null,
      });
      if (status == 200) {
        commit('setAll', data.data);
        commit('setPaginator', data.meta);
        commit('setFilterByGroup', group);
      }
    } catch (error) {
      commit('addErrors', error);
    }
  }
};

// mutations
const mutations = {
  setPassword(state, val) {
    state.model.value.password = val;
  },
  setEmail(state, val) {
    state.model.value.email = val;
  },
  setName(state, val) {
    state.model.value.name = val;
  },
  setFilterByGroup(state, val) {
    state.search.group = val;
    state.search.exportLink = `/api/export?group_id=${val.id}`;
  },
  setSurname(state, val) {
    state.model.value.surname = val;
  },
  setGroup(state, val) {
    state.model.value.group_id = val;
  },
  setPhone(state, val) {
    state.model.value.phone = val;
  },
  setModelValue(state, id) {
    state.model.value = {
      ...state.all.find(model => model.id == id)
    };
  },
  setAll(state, users) {
    state.all = users;
  },
  setPaginator(state, paginator) {
    state.paginator.from = paginator.from;
    state.paginator.to = paginator.to;
    state.paginator.total = paginator.total;
    state.paginator.current_page = paginator.current_page;
    state.paginator.last_page = paginator.last_page;
  },
  setSearchQuery(state, query) {
    state.search.query = query;
  },
  addErrors(state, e) {
    state.errors.push(e);
    console.log(e);
  },
  showMessageOK(state, message) {
    state.message = {
      text: message,
      type: C.message.type.OK,
      show: true,
    };
  },
  showMessageError(state, message) {
    console.log(message)
    console.log('store error')
    state.message = {
      text: message,
      type: C.message.type.ERROR,
      show: true,
    };
  },
  closeMessage(state) {
    state.message.show = false;
  },
  showUpdateModal(state, id) {
    state.model.value = {
      ...state.all.find(model => model.id == id)
    };
    state.modalMode = C.mode.UPDATE;
    state.modalShow = true;
  },
  showCreateModal(state) {
    state.model.value = C.defaultUser;
    state.modalMode = C.mode.CREATE;
    state.modalShow = true;
  },
  showModal(state, show) {
    state.modalShow = show;
  },
  closeModal(state) {
    // for (var key in state.model.value) {
    // 	state.model.value[key] = null;
    // }
    state.modalShow = false;
    state.model.validationErrors = [];
  },
  triggerBin(state) {
    state.search.binFlag = !state.search.binFlag;
    state.search.binLabel = state.search.binFlag ? 'Назад' : 'В корзину';
  },
  setFound(state, found) {
    state.found = found;
  },
  login(state, val) {
    state.login = val;
  },
};

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
};
