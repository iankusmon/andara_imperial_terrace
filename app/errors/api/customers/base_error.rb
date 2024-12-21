module Api
  module Customers
    # id: a unique identifier for this particular occurrence of the problem.
    # status: the HTTP status code applicable to this problem, expressed as a string value.
    # status_name: the HTTP status name applicable to this problem, expressed as a string value.
    # code: an application-specific error code, expressed as a string value
    # title: a short, human-readable summary of the problem that SHOULD NOT change from occurrence to occurrence of the problem.
    # messages: array of string of human-readable explanations specific to this occurrence of the problem.
    class BaseError < Api::BaseError

      def initialize(params)
        # Using double splat because:
        # - We want to convert it into keyword argument to the base class
        # - We don't use params in this class except passing to super class so it still looks straightforward
        # Starting from Ruby 3.0, it does not handle automatic conversion so we need to do manually
        # source: https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/#ruby-3
        super(**params)
        # return if @skip_sentry

        # SentryError.new(
        #   error:     self,
        #   namespace: :customers
        # )
      end

    end
  end
end
