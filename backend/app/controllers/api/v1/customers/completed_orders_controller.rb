# frozen_string_literal: true

module Api
  module V1
    module Customers
      class CompletedOrdersController < ApplicationController
        def index
          customer = Customer.find(params[:customer_id])
          completed_orders = customer.completed_orders
                                     .page(params[:page])
                                     .per(params[:per])
          render json: paginate(completed_orders).to_json
        end
      end
    end
  end
end
