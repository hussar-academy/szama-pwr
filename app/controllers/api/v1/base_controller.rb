module Api
  module V1
    class BaseController < ApplicationController
      # Disables CSRF protection
      skip_before_action :verify_authenticity_token
      # before_action :authenticate_api_with_token! # TODO
    end
  end
end
