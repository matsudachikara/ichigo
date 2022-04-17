# frozen_string_literal: true

FactoryBot.define do
  factory :completed_order do
    association :customer
    sequence(:order_id) { |n| n }
    customer_name { 'Ichigo' }
    total_in_cents { 100 }
    order_date { Time.current }
  end
end
