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

  # NUP Feature

  get "api/admins/nups" => "api/admins/nups#index"
  get "api/admins/nups/:id" => "api/admins/nups#show"
  post "api/admins/nups" => "api/admins/nups#create"
  patch "api/admins/nups/:id" => "api/admins/nups#update"

  # Booking Fee Feature

  get "api/admins/booking_fees" => "api/admins/booking_fees#index"
  get "api/admins/booking_fees/:id" => "api/admins/booking_fees#show"
  post "api/admins/booking_fees" => "api/admins/booking_fees#create"
  patch "api/admins/booking_fees/:id" => "api/admins/booking_fees#update"
  get "api/admins/booking_fees/:id/download_spkb_documents/" => "api/admins/booking_fees#download_spkb_document"

  # Down Payment Feature

  get "api/admins/down_payments" => "api/admins/down_payments#index"
  get "api/admins/down_payments/:id" => "api/admins/down_payments#show"
  post "api/admins/down_payments" => "api/admins/down_payments#create"
  patch "api/admins/down_payments/:id" => "api/admins/down_payments#update"

  # KPR Feature

  get 'api/admins/customers/kpr_documents' => "api/admins/customers/kpr_documents#index"
  # get 'api/admins/customers/kpr_documents/:id' => "api/admins/customers/kpr_documents/:id#show"
  post 'api/admins/customers/kpr_documents' => "api/admins/customers/kpr_documents#create"
  # put 'api/admins/customers/kpr_documents/:id' => "api/admins/customers/kpr_documents/:id#update"

  #KPR Admin Feature

  get "api/admins/kprs" => "api/admins/kprs#index"
  get "api/admins/kprs/:id" => "api/admins/kprs#show"
  post "api/admins/kprs" => "api/admins/kprs#create"
  patch "api/admins/kprs/:id" => "api/admins/kprs#update"

  #CMS Article Feature

  get "api/admins/articles" => "api/admins/articles#index"
  get "api/admins/articles/:id" => "api/admins/articles#show"
  post "api/admins/articles" => "api/admins/articles#create"
  patch "api/admins/articles/:id" => "api/admins/articles#update" 

  #Villa Unit Kavling
  get "api/admins/villa_unit_kavlings" => "api/admins/villa_unit_kavlings#index"
  get "api/admins/villa_unit_kavlings/:id" => "api/admins/villa_unit_kavlings#show"
  post "api/admins/villa_unit_kavlings" => "api/admins/villa_unit_kavlings#create"
  patch "api/admins/villa_unit_kavlings/:id" => "api/admins/villa_unit_kavlings#update" 
  

  ## Customers

  # NUP Feature

  post 'api/customers/nups' => "api/customers/nups#create"

  # Booking Fee Feature

  post 'api/customers/booking_fees' => "api/customers/booking_fees#create"

  # Down Payment Feature

  post 'api/customers/down_payments' => "api/customers/down_payments#create"

  # KPR Feature

  get 'api/customers/kpr_documents' => "api/customers/kpr_documents#index"
  # get 'api/customers/kpr_documents/:id' => "api/customers/kpr_documents/:id#show"
  post 'api/customers/kpr_documents' => "api/customers/kpr_documents#create"
  # put 'api/customers/kpr_documents/:id' => "api/customers/kpr_documents/:id#update"

  ## KPR Calculator
  post 'api/customers/kpr_calculators' => "api/customers/kpr_calculators#execute"

  # AJB dan PPJB Feature
   
  get "api/admins/ajb_documents" => "api/admins/ajb_documents#index"
  get "api/admins/ajb_documents/:id" => "api/admins/ajb_documents#show"
  post "api/admins/ajb_documents" => "api/admins/ajb_documents#create"
  patch "api/admins/ajb_documents/:id" => "api/admins/ajb_documents#update"

  get "api/admins/ppjb_documents" => "api/admins/ppjb_documents#index"
  get "api/admins/ppjb_documents/:id" => "api/admins/ppjb_documents#show"
  post "api/admins/ppjb_documents" => "api/admins/ppjb_documents#create"
  patch "api/admins/ppjb_documents/:id" => "api/admins/ppjb_documents#update"

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

  


