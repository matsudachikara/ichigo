# frozen_string_literal: true

module Api
  module V1
    module Customers
      class CustomerTiersController < ApplicationController
        def show
          customer_tier = CustomerTier.find_by(customer_id: params[:customer_id])
          render json: customer_tier.to_json_for_api
        end
      end
    end
  end
end
