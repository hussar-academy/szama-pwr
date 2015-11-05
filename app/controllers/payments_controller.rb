class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
    User.find_each do |user|
      @payment.balance_changes.new(user: user)
    end
  end

  def index
    @payments = Payment.all
    @users = User.all
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.balance_changes.each do |bc|
      bc.change = -(bc.change.abs)
    end

    if @payment.save
      redirect_to payments_path
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:title, :creator_id, balance_changes_attributes: [:user_id, :change])
  end
end
