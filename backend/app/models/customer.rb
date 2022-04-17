# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :completed_orders, dependent: :destroy
  has_one :customer_tier, dependent: :destroy

  def dollars_spent_this_year
    beginning_of_this_year = Date.current.beginning_of_year.beginning_of_day
    end_of_this_year = Date.current.end_of_year.end_of_day
    orders_total_in_cents_this_year = orders_total_in_cents(start_date: beginning_of_this_year, end_date: end_of_this_year)
    orders_total_in_cents_this_year / 100
  end

  def orders_total_in_cents(start_date:, end_date:)
    completed_orders.where(order_date: start_date...end_date)
                    .sum(:total_in_cents)
  end
end
