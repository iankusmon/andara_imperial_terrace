Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # House Units
  namespace :api do
    resources :house_units, only: [:index, :create, :show, :update]
  end
  get 'api/house_units', action: :index, controller: 'api/house_units'
  post 'api/house_units', action: :create, controller: 'api/house_units'
  get 'api/house_units/:id', action: :show, controller: 'api/house_units'
  put 'api/house_units/:id', action: :update, controller: 'api/house_units'

  # House Rent Units
  get 'api/house_rent_units' => "api/house_rent_units#index"
  get 'api/house_rent_units/:id', to: 'api/house_rent_units#show'
  post 'api/house_rent_units', to: 'api/house_rent_units#create'
  put 'api/house_rent_units/:id', to: 'api/house_rent_units#update'

  # Tour Packages Units
  get 'api/tour_packages' => "api/tour_packages#index"
  get 'api/tour_packages/:id', to: 'api/tour_packages#show'
  post 'api/tour_packages', to: 'api/tour_packages#create'
  put 'api/tour_packages/:id', to: 'api/tour_packages#update'
end
