<template>
  <div>
    <div class="title">
      <h1 class="title-text">Customer List</h1>
    </div>
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Tier</th>
          <th>Order List</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(customer, i) in customers.data" :key="customer.id">
          <th>{{ customer.name }}</th>
          <td>
            <nuxt-link :to="`/customers/${customer.id}/tier`">view</nuxt-link>
          </td>
          <td>
            <nuxt-link :to="`/customers/${customer.id}/orderList`"
              >view</nuxt-link
            >
          </td>
        </tr>
      </tbody>
    </table>
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
  methods: {},
}
</script>

<style lang="scss">
.title {
  padding: 1rem 0;
  background-color: #ffffff;
  text-align: center;
  &-text {
    font-weight: bold;
    font-size: 1rem;
  }
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
}
th,
td {
  height: 40px;
  padding: 0 1rem;
  border-bottom: thin solid rgba(0, 0, 0, 0.12);
  text-align: left;
  font-weight: normal;
}
</style>
