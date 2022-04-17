# frozen_string_literal: true

class CompletedOrder < ApplicationRecord
  belongs_to :customer
end
