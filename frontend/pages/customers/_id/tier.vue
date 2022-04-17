<template>
  <div>
    <div>Tier</div>
    <table>
      <thead>
        <tr>
          <th>Customer ID</th>
          <th>Customer Name</th>
          <th>Current Tier</th>
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
        <tr>
          <th>{{ tier.customer_id }}</th>
          <th>{{ tier.customer_name }}</th>
          <td>{{ tier.current_tier }}</td>
          <td>{{ tier.start_date }}</td>
          <td>{{ tier.dollars_spent_since_start }}</td>
          <td>{{ tier.dollars_needed_for_next_tier }}</td>
          <td>{{ tier.tier_downgraded_next_year }}</td>
          <td>{{ tier.end_date }}</td>
          <td>{{ tier.dollars_needed_to_keep_tier }}</td>
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
      tier: this.$store.getters['models/customer_tier/object'],
    }
  },
  watch: {
    '$route.query': '$fetch',
  },
  async fetch({ store, params }) {
    await store.dispatch('models/customer_tier/getObject', params.id)
  },
  methods: {},
}
</script>

<style lang="scss"></style>
