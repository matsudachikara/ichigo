# frozen_string_literal: true

class CustomerTier < ApplicationRecord
  belongs_to :customer
  enum tier: { bronze: 0, silver: 1, gold: 2 }
  TIER_CONDITIONS = {
    bronze: 0,
    silver: 100,
    gold: 500,
  }.freeze
  # 🥉 Bronze = default tier, from $0 spent
  # 🥈 Silver = at least $100 spent since the start of last year
  # 🥇 Gold = at least $500 spent since the start of last year
end
