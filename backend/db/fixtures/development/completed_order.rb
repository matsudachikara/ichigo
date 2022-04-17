# frozen_string_literal: true

CompletedOrder.seed do |s|
  customer_id = 1
  s.id = 1
  s.customer_id = customer_id
  s.order_id = 1
  s.customer_name = "customer#{customer_id}"
  s.total_in_cents = 100
  s.order_date = DateTime.new(2021, 1, 1)
end

CompletedOrder.seed do |s|
  customer_id = 1
  s.id = 1
  s.customer_id = customer_id
  s.order_id = 1
  s.customer_name = "customer#{customer_id}"
  s.total_in_cents = 4000
  s.order_date = DateTime.new(2022, 1, 1)
end

CompletedOrder.seed do |s|
  customer_id = 2
  s.id = 2
  s.customer_id = customer_id
  s.order_id = 2
  s.customer_name = "customer#{customer_id}"
  s.total_in_cents = 10_000
  s.order_date = DateTime.new(2021, 1, 1)
end

CompletedOrder.seed do |s|
  customer_id = 2
  s.id = 2
  s.customer_id = customer_id
  s.order_id = 2
  s.customer_name = "customer#{customer_id}"
  s.total_in_cents = 10_000
  s.order_date = DateTime.new(2022, 1, 1)
end

CompletedOrder.seed do |s|
  customer_id = 3
  s.id = 3
  s.customer_id = customer_id
  s.order_id = 3
  s.customer_name = "customer#{customer_id}"
  s.total_in_cents = 50_000
  s.order_date = DateTime.new(2021, 1, 1)
end

CompletedOrder.seed do |s|
  customer_id = 4
  s.id = 4
  s.customer_id = customer_id
  s.order_id = 4
  s.customer_name = "customer#{customer_id}"
  s.total_in_cents = 50_000
  s.order_date = DateTime.new(2021, 1, 1)
end

CompletedOrder.seed do |s|
  customer_id = 4
  s.id = 5
  s.customer_id = customer_id
  s.order_id = 5
  s.customer_name = "customer#{customer_id}"
  s.total_in_cents = 50_000
  s.order_date = DateTime.new(2022, 1, 1)
end

# add more random data
95.times do |i|
  CompletedOrder.seed do |s|
    customer_id = i + 6
    s.id = i + 6
    s.customer_id = customer_id
    s.order_id = i + 6
    s.customer_name = "customer#{customer_id}"
    s.total_in_cents = rand(0...100000)
    s.order_date = DateTime.new(2021, 1, 1)
  end
end

95.times do |i|
  CompletedOrder.seed do |s|
    customer_id = i + 6
    s.id = i + 106
    s.customer_id = customer_id
    s.order_id = i + 106
    s.customer_name = "customer#{customer_id}"
    s.total_in_cents = rand(0...100000)
    s.order_date = DateTime.new(2022, 2, 1)
  end
end

1000.times do |i|
  CompletedOrder.seed do |s|
  customer_id = rand(6...100)
  s.id = i + 106
    s.customer_id = customer_id
    s.order_id = i + 106
    s.customer_name = "customer#{customer_id}"
    s.total_in_cents = rand(0...100000)
    s.order_date = DateTime.new(2022, 2, 1)
  end
end
