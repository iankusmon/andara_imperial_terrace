module Api
  module Admins
    # Handles specific notification logic for Admin Namespace errors
    # Calls super class Api::V2::BaseError initialize method.
    class BaseError < Api::BaseError

      def initialize(params)
        # Using double splat because:
        # - We want to convert it into keyword argument to the base class
        # - We don't use params in this class except passing to super class so it still looks straightforward
        # Starting from Ruby 3.0, it does not handle automatic conversion so we need to do manually
        # source: https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/#ruby-3
        super(**params)

      end

    end
  end
end