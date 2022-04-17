# frozen_string_literal: true

CompletedOrder.seed do |s|
  s.id = 1
  s.customer_id = 1
  s.order_id = 1
  s.customer_name = "customer1"
  s.total_in_cents = 100
  s.order_date = DateTime.new(2021, 1, 1)
end

CompletedOrder.seed do |s|
  s.id = 2
  s.customer_id = 2
  s.order_id = 2
  s.customer_name = "customer2"
  s.total_in_cents = 10000
  s.order_date = DateTime.new(2021, 1, 1)
end

CompletedOrder.seed do |s|
  s.id = 3
  s.customer_id = 3
  s.order_id = 3
  s.customer_name = "customer3"
  s.total_in_cents = 50000
  s.order_date = DateTime.new(2021, 1, 1)
end
