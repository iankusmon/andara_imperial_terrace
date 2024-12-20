Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # villa Units
  namespace :api do
    resources :villa_units, only: [:index, :create, :show, :update]
  end
  get 'api/villa_units', action: :index, controller: 'api/villa_units'
  post 'api/villa_units', action: :create, controller: 'api/villa_units'
  get 'api/villa_units/:id', action: :show, controller: 'api/villa_units'
  put 'api/villa_units/:id', action: :update, controller: 'api/villa_units'

  # villa Rent Units
  get 'api/villa_rent_units' => "api/villa_rent_units#index"
  get 'api/villa_rent_units/:id', to: 'api/villa_rent_units#show'
  post 'api/villa_rent_units', to: 'api/villa_rent_units#create'
  put 'api/villa_rent_units/:id', to: 'api/villa_rent_units#update'

  # Tour Packages Units
  get 'api/packages' => "api/packages#index"      
  get 'api/packages/:id', to: 'api/packages#show'
  post 'api/packages', to: 'api/packages#create'
  put 'api/packages/:id', to: 'api/packages#update'

  ## Admins

  # NUP Features

  get "api/admins/nups" => "api/admins/nups#index"
  get "api/admins/nups/:id" => "api/admins/nups#show"
  post "api/admins/nups" => "api/admins/nups#create"
  patch "api/admins/nups/:id" => "api/admins/nups#update"

  # KPR Features

  get 'api/admins/customers/kpr_documents' => "api/admins/customers/kpr_documents#index"
  # get 'api/admins/customers/kpr_documents/:id' => "api/admins/customers/kpr_documents/:id#show"
  post 'api/admins/customers/kpr_documents' => "api/admins/customers/kpr_documents#create"
  # put 'api/admins/customers/kpr_documents/:id' => "api/admins/customers/kpr_documents/:id#update"

  ## Customers

  # NUP Features

  post 'api/customers/nups' => "api/customers/nups#create"

  # KPR Feature

  get 'api/customers/kpr_documents' => "api/customers/kpr_documents#index"
  # get 'api/customers/kpr_documents/:id' => "api/customers/kpr_documents/:id#show"
  post 'api/customers/kpr_documents' => "api/customers/kpr_documents#create"
  # put 'api/customers/kpr_documents/:id' => "api/customers/kpr_documents/:id#update"

  ## KPR Calculator
  post 'api/customers/kpr_calculators' => "api/customers/kpr_calculators#execute"
    
  get 'api/admins/customers', action: :index, controller: 'api/admins/customers'
  get 'api/admins/customers/:id', action: :show, controller: 'api/admins/customers'
  post 'api/admins/customers', action: :create, controller: 'api/admins/customers'
  patch 'api/admins/customers/:id', action: :update, controller: 'api/admins/customers'
  get 'api/admins/profile', action: :profile, controller: 'api/admins'

  namespace :api do
    namespace :admins do
      patch 'update_password', to: '/api/admins#update_password'
      post 'sign_up', to: 'sign_ups#create'
      post 'login', to: 'sessions#login'
      delete 'logout', to: '/api/admins#logout'
    end
  end

  namespace :api do
    resources :admins, only: [:index, :create, :show, :update]
  end

  # Customers
  namespace :api do
    resources :customers, only: [:index, :create, :show, :update]
  end
  # get 'api/customers/:id', action: :index, controller: 'api/customers'  #to view the profile detail of agent affiliates we have in database
  # put 'api/customers/:id', action: :update, controller: 'api/customers' #to update the profile of agent affiliates we have in database
  get 'api/customers/villa_units/:id?action=buy', action: :show, controller: 'api/customers/villa_units' #to track the progress of buying villa units
  get 'api/customers/villa_units/:id?action=rent', action: :show, controller: 'api/customers/villa_units' #to track the progress of rent villa units
  get 'api/customers/packages/:id', action: :create, controller: 'api/customers/packages' #to track the progress of tour packages

  # /customers/signups
  namespace :signups do
    post :email
    post :google
    post :facebook
  end

  # Customer Address
  namespace :api do
    resources :customer_addresses, only: [:index, :create, :show, :update]
  end

  # Visit Records 
  namespace :api do
    resources :visit_records, only: [:index, :create, :show, :update]
  end

  # Share Social Media
  namespace :api do
    resources :share_social_media, only: [:index, :create, :show, :update]
  end
  get 'api/share_social_media', action: :index, controller: 'api/share_social_media'
  
end

  


