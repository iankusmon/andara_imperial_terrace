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

   # Admins
   namespace :api do
    resources :admins, only: [:index, :create, :show, :update]
  end
  get 'api/admins/customers', action: :index, controller: 'api/admins/customers'
  get 'api/admins/customers/:id', action: :show, controller: 'api/admins/customers'
  post 'api/admins/customers', action: :create, controller: 'api/admins/customers'
  put 'api/admins/customers/:id', action: :update, controller: 'api/admins/customers'

   # Customers
   namespace :api do
    resources :customers, only: [:index, :create, :show, :update]
  end
  get 'api/customers/:id', action: :index, controller: 'api/customers'  #to view the profile detail of agent affiliates we have in database
  put 'api/customers/:id', action: :update, controller: 'api/customers' #to update the profile of agent affiliates we have in database
  get 'api/customers/house_units/:id?action=buy', action: :show, controller: 'api/customers/house_units' #to track the progress of buying house units
  get 'api/customers/house_units/:id?action=rent', action: :show, controller: 'api/customers/house_units' #to track the progress of rent house units
  get 'api/customers/tour_packages/:id', action: :create, controller: 'api/customers/tour_packages' #to track the progress of tour packages
end
