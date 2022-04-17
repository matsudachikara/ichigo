# frozen_string_literal: true

100.times do |i|
  Customer.seed do |s|
    s.id = i + 1
    s.name = "customer#{i + 1}"
  end
end
