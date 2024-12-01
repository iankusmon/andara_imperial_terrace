module Api
  module Admins
    class BaseController < ApplicationController
      before_action :authentication_admin
    end
  end
end

