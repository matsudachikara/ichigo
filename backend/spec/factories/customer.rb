# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { 'Ichigo' }
  end

  trait :with_completed_orders do
    transient do
      completed_order_count { 1 }
      total_in_cents { 100 }
      order_date { Time.current }
    end
    after(:create) do |customer, evaluator|
      evaluator.completed_order_count.times do
        create :completed_order,
               customer: customer,
               customer_name: customer.name,
               total_in_cents: evaluator.total_in_cents,
               order_date: evaluator.order_date
      end
    end
  end
end
