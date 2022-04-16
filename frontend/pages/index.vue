<template>
  <div class="index-container">
    <div class="title">Customers</div>
    <a
      v-for="(customer, i) in customers.data"
      :key="i"
      :href="link_url(customer)"
      >{{ customer.name }}</a
    >
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  components: {},
  data() {
    return {}
  },
  async fetch({ store, route }) {
    await store.dispatch('pages/_index/getCustomers', {
      page: route.query.page,
      per: 12,
    })
  },
  computed: {
    ...mapGetters('pages/_index', {
      customers: 'customers',
    }),
  },
  methods: {
    link_url(customer) {
      return `/customers/${customer.id}`
    },
  },
}
</script>

<style lang="scss">
.index-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
}
</style>
