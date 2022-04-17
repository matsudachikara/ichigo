# frozen_string_literal: true

class CreateCustomerTierService
  attr_reader :result, :customer, :customer_tier

  def self.call(customer:)
    new(customer: customer).run
  end

  def initialize(customer:)
    @customer = customer
    @customer_tier = CustomerTier.find_or_initialize_by(customer: @customer)
  end

  def run
    # calculate tier based on orders between start of last year and end of last year
    start_date = Date.current.last_year.beginning_of_year.beginning_of_day
    end_date = Date.current.last_year.end_of_year.end_of_day
    orders_total_in_cents = @customer.orders_total_in_cents(start_date: start_date, end_date: end_date)

    @customer_tier.start_date = start_date
    @customer_tier.end_date = end_date
    @customer_tier.dollars_spent_since_start = orders_total_in_cents / 100

    case @customer_tier.dollars_spent_since_start
    when CustomerTier::TIER_CONDITIONS[:bronze]...CustomerTier::TIER_CONDITIONS[:silver]
      @customer_tier.tier = 'bronze'
    when CustomerTier::TIER_CONDITIONS[:silver]...CustomerTier::TIER_CONDITIONS[:gold]
      @customer_tier.tier = 'silver'
    when CustomerTier::TIER_CONDITIONS[:gold]...Float::INFINITY
      @customer_tier.tier = 'gold'
    end
    @customer_tier.save!
    @result = @customer_tier.present?
    self
  rescue StandardError => e
    Rails.logger.error(e)
    @result = false
    self
  end
end
