# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: %i[index] do
        scope module: :customers do
          resources :completed_orders, only: %i[index]
        end
      end
    end
  end
end
