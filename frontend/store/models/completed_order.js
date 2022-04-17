export const state = () => ({
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
  list: (state) => {
    return state.list
  },
}

export const mutations = {
  setList(state, list) {
    state.list = list
  },
}

export const actions = {
  async getList({
    commit
  }, params) {
    return await this.$axios
      .$get(`api/v1/customers/${params.id}/completed_orders`, {
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
