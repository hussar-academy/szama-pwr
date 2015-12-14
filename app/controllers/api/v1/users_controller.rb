module Api
  module V1
    class UsersController < Api::V1::BaseController
      def index
        users = User.all
        users = users.map do |user|
          ::V1::UserRepresenter.new(user).basic
        end
        render json: users
      end
    end
  end
end
