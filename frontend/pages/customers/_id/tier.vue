<template>
  <div>
    <div class="title">
      <h1 class="title-text">Customer Tier</h1>
    </div>
    <div class="content">
      <div class="content-left">
        <img class="tier-image" :src="tierImage()" />
      </div>
      <div class="content-right">
        <div class="customer-name">Hello {{ tier.customer_name }},</div>
        <div class="customer-tier">
          You are in
          <span :class="tierColorClass">{{ tier.current_tier }}</span> tier!
        </div>
        <div class="progress-wrap">
          <div class="progress">
            <div class="progress-bar">
              <div class="progress-bar-value" :style="progressBarStyles"></div>
            </div>
            <div class="progress-numbers">
              ${{ tier.dollars_spent_this_year }} / ${{
                tier.dollars_needed_for_next_tier + tier.dollars_spent_this_year
              }}
            </div>
          </div>
          <div class="progress-title">
            Amount that must be spent in order to reach the next tier (or to
            keep the gold tier)
          </div>
        </div>
        <div class="customer-info">
          <div class="customer-info-box">
            <div class="period-title">Current tier valid period</div>
            <div class="period">
              {{ this.$dayjs(tier.start_date).format('YYYY/MM/DD') }}~
              {{ this.$dayjs(tier.end_date).format('YYYY/MM/DD') }}
            </div>
          </div>
          <div class="customer-info-box">
            <div class="next-year-tier">
              You will be in
              <span :class="nextYearTierColorClass">{{
                tier.next_year_tier
              }}</span>
              tier from next year
            </div>
          </div>
        </div>
      </div>
    </div>
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
  computed: {
    tierColorClass() {
      return `color-${this.tier.current_tier}`
    },
    nextYearTierColorClass() {
      return `color-${this.tier.next_year_tier}`
    },
    progressBarStyles() {
      return {
        '--progress-bar-width': `${
          (this.tier.dollars_spent_this_year /
            (this.tier.dollars_needed_for_next_tier +
              this.tier.dollars_spent_this_year)) *
          100
        }%`,
      }
    },
  },
  methods: {
    tierImage() {
      return require(`@/assets/images/${this.tier.current_tier}.png`)
    },
  },
}
</script>

<style lang="scss" scoped>
.title {
  padding: 1rem 0;
  background-color: #ffffff;
  text-align: center;
  &-text {
    font-weight: bold;
    font-size: 1rem;
  }
}
.content {
  display: flex;
  justify-content: center;
  margin-bottom: 2rem;
  padding: 2.75rem 1rem;
  background-color: #ffffff;

  .content-left {
    margin-right: 2rem;
    display: flex;
    .tier-image {
      width: 6.25rem;
      height: 6.25rem;
      margin-right: 0.5rem;
    }
  }

  .content-right {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    .customer-name {
      margin-bottom: 0.5rem;
      line-height: 1.5;
      font-weight: bold;
      font-size: 1.25rem;
    }
    .customer-info {
      display: flex;
      gap: 1rem;
      &-box {
        padding-right: 1rem;
        &:not(:last-child) {
          border-right: 1px solid #e0e0e0;
        }
      }
    }
  }
}

.color-bronze {
  color: #cd7f32;
  font-weight: bold;
}
.color-silver {
  color: #c0c0c0;
  font-weight: bold;
}
.color-gold {
  color: #ffd700;
  font-weight: bold;
}

.progress-wrap {
}
.progress-title {
  font-size: 13px;
}
.progress {
  justify-content: center;
  align-items: center;
  display: flex;
  padding: 0;
  margin: 0;
  gap: 1rem;
  &-bar {
    background: rgba(255, 255, 255, 0.1);
    justify-content: flex-start;
    border-radius: 100px;
    border: 2px solid red;
    align-items: center;
    position: relative;
    display: flex;
    width: 500px;
    &-value {
      animation: bar-next-tier 3s normal forwards;
      box-shadow: 0 10px 40px -10px #fff;
      border-radius: 100px;
      background-color: #e83434;
      height: 30px;
      width: 0;
    }
  }
}
@keyframes bar-next-tier {
  0% {
    width: 0;
  }
  100% {
    width: var(--progress-bar-width);
  }
}
</style>
