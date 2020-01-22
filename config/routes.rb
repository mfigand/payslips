# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/ping', to: 'api/v1/ping#ping'

  namespace :api do
    namespace :v1 do
      get '/ping', to: 'ping#ping', as: 'ping'

      get '/payslips', to: 'payslips#index'
    end
  end
end
