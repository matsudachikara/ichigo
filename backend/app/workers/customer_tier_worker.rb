# frozen_string_literal: true

class CustomerTierWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform
    Customer.all.each do |customer|
      CreateCustomerTierService.call(customer: customer)
    end
  end
end
