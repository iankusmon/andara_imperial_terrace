module Api
  module Customers
    class KprCalculatorsController < ApplicationController
        
      def execute
        params = execute_request()

        kpr_data = ::Customers::Kpr::CalculatorService.execute(
          property_price:             params[:property_price],
          down_payment_percentage:    params[:down_payment_percentage],
          tenor_period:               params[:tenor_period],
          fixed_rate:                 params[:fixed_rate],
          fixed_rate_period:          params[:fixed_rate_period],
          floating_rate:              params[:floating_rate],
          floating_rate_period:       params[:floating_rate_period]
        )
        render json: kpr_data
      end

      private

      def execute_request
        params.require(:kpr_calculator).permit(
            :property_price,
            :down_payment_percentage,
            :tenor_period,
            :fixed_rate,
            :fixed_rate_period,
            :floating_rate,
            :floating_rate_period
        )
      end

    end
  end
end
end
