export const state = () => ({
  object: null,
  list: {
    data: [],
    meta: {
      current_page: null,
      total_pages: null,
      limit_value: null,
      total_count: null,
    },
  },
})

export const getters = {
  object: (state) => {
    return state.object
  },
  list: (state) => {
    return state.list
  },
}

export const mutations = {
  setObject(state, object) {
    state.object = object
  },
  setList(state, list) {
    state.list = list
  },
}

export const actions = {
  async getObject({
    commit
  }, id) {
    await this.$axios
      .$get(`api/v1/customers/${id}`)
      .then((res) => {
        commit('setObject', res)
      })
      .catch((error) => {
        return error
      })
  },
  async getList({
    commit
  }, params) {
    return await this.$axios
      .$get(`api/v1/customers`, {
        params: params
      })
      .then((res) => {
        commit('setList', res)
        return res
      })
      .catch((error) => {
        return error
      })
  },
}
