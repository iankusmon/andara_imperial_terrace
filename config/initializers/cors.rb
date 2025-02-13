# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.production?
      origins 'andaraimperialterrace.co.id',           # customer
              'www.andaraimperialterrace.co.id',       # customer
              'admin.andaraimperialterrace.co.id'      # internal/admin

    elsif Rails.env.staging?
      origins 'andaraimperialterrace.click',
              'admin.andaraimperialterrace.click'
              'www.andaraimperialterrace.co.id'

    else
      # origins 'localhost:3001',
      #         'localhost:3002',
      #         'localhost:3003',
      #         'localhost:3004',
      #         '127.0.0.1:3004',
      #         '10.0.2.2:3004',
      #         'localhost:3005',
      #         'localhost:3333',
      #         'localhost:30099',
      #         '127.0.0.1:19000',
      #         'andaraimperialterrace.click',
      #         'admin.andaraimperialterrace.click',
      #         '127.0.0.1:3000'
      #         'localhost:3000',
      #         'www.andaraimperialterrace.co.id',
      #         'admin.andaraimperialterrace.co.id'
      origins '*'
    end

    resource '*', headers:     :any,
                  methods:     [:get, :post, :put, :patch, :delete, :options, :head],
                  credentials: true
  end
end

Rails.application.config.action_controller.forgery_protection_origin_check = false
