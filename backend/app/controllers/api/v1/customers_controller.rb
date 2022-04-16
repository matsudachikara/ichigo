# frozen_string_literal: true

module Api
  module V1
    class CustomersController < ApplicationController
      def index
        customers = Customer.page(params[:page])
                            .per(params[:per])
        render json: paginate(customers).to_json
      end
    end
  end
end
