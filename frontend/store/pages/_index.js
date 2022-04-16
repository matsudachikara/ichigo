export const state = () => ({
  customers: [],
})

export const getters = {
  customers(state) {
    return state.customers
  },
}

export const mutations = {
  setCustomers(state, customers) {
    state.customers = customers
  },
}

export const actions = {
  async getCustomers({
    dispatch,
    commit
  }, params) {
    await dispatch('models/customer/getList', params, {
      root: true
    }).then(
      (res) => {
        commit('setCustomers', res)
        return res
      }
    )
  },
}
