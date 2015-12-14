module Api
  module V1
    class BaseController < ApplicationController
      # Disables CSRF protection
      skip_before_action :verify_authenticity_token
      # before_action :authenticate_api_with_token!

      def current_user
        @current_user
      end

      # def authenticate_api_with_token!
      #   puts "HEADERS: #{request.headers.inspect}"
      #   response = authenticate_or_request_with_http_token do |token, options|
      #     puts "TOKEN: #{token}"
      #     api_key = ApiKey.find_by(auth_token: token)
      #     if api_key && api_key.valid?
      #       @current_user = api_key.user
      #     else
      #       fail "Not found!"
      #     end
      #   end
      # end

    end
  end
end
