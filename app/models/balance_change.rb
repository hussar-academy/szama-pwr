class BalanceChange < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment

  validates :user, presence: true
  validates :payment, presence: true
  validates :change, presence: true, numericality: true

  after_create :update_user_balance

  private

  def update_user_balance
    user.reload
    user.balance = user.balance + change
    user.save!
  end
end
