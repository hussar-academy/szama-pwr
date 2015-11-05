class Payment < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :balance_changes, inverse_of: :payment

  accepts_nested_attributes_for :balance_changes, reject_if: :reject_empty

  validates :title, presence: true
  validates :creator, presence: true

  after_create :create_payer_balance_change

  private

  def create_payer_balance_change
    sum = balance_changes.sum(:change).abs
    balance_changes.create!(user: creator, change: sum)
  end

  def reject_empty(attributes)
    attributes[:change].blank?
  end
end
