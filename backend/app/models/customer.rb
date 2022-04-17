# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :completed_orders, dependent: :destroy
end
