export const state = () => ({
  object: null,
})

export const getters = {
  object: (state) => {
    return state.object
  },
}

export const mutations = {
  setObject(state, object) {
    state.object = object
  },
}

export const actions = {
  async getObject({
    commit
  }, id) {
    await this.$axios
      .$get(`api/v1/customers/${id}/customer_tier`)
      .then((res) => {
        commit('setObject', res)
      })
      .catch((error) => {
        return error
      })
  },
}
