# frozen_string_literal: true

class CustomerTier < ApplicationRecord
  belongs_to :customer
  enum tier: { bronze: 0, silver: 1, gold: 2 }
  TIER_CONDITIONS = {
    bronze: 0,
    silver: 100,
    gold: 500
  }.freeze
  # 🥉 Bronze = default tier, from $0 ~ $99 between the start of last year and end of last year
  # 🥈 Silver = at least $100 spent between the start of last year and end of last year
  # 🥇 Gold = at least $500 spent between the start of last year and end of last year

  def dollars_needed_for_next_tier
    dollars_spent_this_year = customer.dollars_spent_this_year
    dollars_needed = case tier
                     when 'bronze'
                       TIER_CONDITIONS[:silver] - dollars_spent_this_year
                     when 'silver'
                       TIER_CONDITIONS[:gold] - dollars_spent_this_year
                     when 'gold'
                      # when it's gold, it returns dollars needed to keep gold tier
                      TIER_CONDITIONS[:gold] - dollars_spent_this_year
                     end
    if dollars_needed.negative?
      return 0
    else
      return dollars_needed
    end
  end

  def dollars_needed_to_keep_tier
    dollars_spent_this_year = customer.dollars_spent_this_year
    dollars_needed = case tier
                     when 'bronze'
                       0
                     when 'silver'
                       CustomerTier::TIER_CONDITIONS[:silver] - dollars_spent_this_year
                     when 'gold'
                       CustomerTier::TIER_CONDITIONS[:gold] - dollars_spent_this_year
                     end
    if dollars_needed.negative?
      return 0
    else
      return dollars_needed
    end
  end

  def tier_downgraded_next_year
    next_tier = case customer.dollars_spent_this_year
                when CustomerTier::TIER_CONDITIONS[:bronze]...CustomerTier::TIER_CONDITIONS[:silver]
                  'bronze'
                when CustomerTier::TIER_CONDITIONS[:silver]...CustomerTier::TIER_CONDITIONS[:gold]
                  'silver'
                when CustomerTier::TIER_CONDITIONS[:gold]...Float::INFINITY
                  'gold'
                end
    tier === next_tier ? nil : next_tier
  end

  def next_year_tier
    case customer.dollars_spent_this_year
    when CustomerTier::TIER_CONDITIONS[:bronze]...CustomerTier::TIER_CONDITIONS[:silver]
      'bronze'
    when CustomerTier::TIER_CONDITIONS[:silver]...CustomerTier::TIER_CONDITIONS[:gold]
      'silver'
    when CustomerTier::TIER_CONDITIONS[:gold]...Float::INFINITY
      'gold'
    end
  end

  def to_json_for_api
    {
      customer_id: customer_id,
      customer_name: customer.name,
      current_tier: tier,
      next_year_tier: next_year_tier,
      start_date: start_date,
      dollars_spent_since_start: dollars_spent_since_start + customer.dollars_spent_this_year,
      dollars_spent_this_year: customer.dollars_spent_this_year,
      dollars_needed_for_next_tier: dollars_needed_for_next_tier,
      dollars_needed_to_keep_tier: dollars_needed_to_keep_tier,
      tier_downgraded_next_year: tier_downgraded_next_year,
      end_date: Date.current.end_of_year.end_of_day
    }.to_json
  end
end
