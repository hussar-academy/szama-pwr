module Api
  module V1
    class PaymentsController < Api::V1::BaseController
      def index
        payments = Payment.all
        payments = payments.map do |payment|
          ::V1::PaymentRepresenter.new(payment).basic
        end
        render json: payments
      end

      def create
        payment = Payment.new(payment_params)
        balance_changes_params.each do |bc|
          payment.balance_changes.new(bc)
        end
        payment.save!
        render json: ::V1::PaymentRepresenter.new(payment).basic, status: 201
      end

      private

      def payment_params
        params.permit(:title, :creator_id)
      end

      def balance_changes_params
        params.permit(balance_changes: [:user_id, :change]).fetch("balance_changes")
      end
    end
  end
end
