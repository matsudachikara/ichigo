<template>
  <div>
    <div>Tier</div>
    <table>
      <thead>
        <tr>
          <th>Customer Name</th>
          <th>Current tier</th>
          <th>Start Date</th>
          <th>Amount spent since that start date</th>
          <th>Amount that must be spent in order to reach the next tier</th>
          <th>The tier the customer will be downgraded to next year</th>
          <th>The date of the downgrade</th>
          <th>
            How much the customer needs to spend this year in order to avoid
            being downgraded
          </th>
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
