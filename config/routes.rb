Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get 'api/house_rents' => "api/house_rent_units#index"
  get 'api/house_rents/:id', to: 'api/house_rent_units#show'
  post 'api/house_rents', to: 'api/house_rent_units#create'
  put 'api/house_rents/:id', to: 'api/house_rent_units#update'
end
