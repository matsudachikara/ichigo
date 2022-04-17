<template>
  <div>
    <div class="title">
      <h1 class="title-text">Order List</h1>
    </div>
    <table>
      <thead>
        <tr>
          <th>Order ID</th>
          <th>Customer Name</th>
          <th>Total in cents</th>
          <th>Order Date</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(order, i) in orders.data" :key="order.id">
          <th>{{ order.order_id }}</th>
          <td>
            {{ order.customer_name }}
          </td>
          <td>
            {{ order.total_in_cents }}
          </td>
          <td>
            {{ order.order_date }}
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
    return {
      orders: this.$store.getters['models/completed_order/list'],
    }
  },
  watch: {
    '$route.query': '$fetch',
  },
  async fetch({ store, params }) {
    await store.dispatch('models/completed_order/getList', params.id)
  },
  methods: {},
}
</script>

<style lang="scss"></style>
