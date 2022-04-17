<template>
  <div>
    <div class="title">Customer List</div>
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

<style lang="scss"></style>
