class User < ActiveRecord::Base
  has_many :payments, foreign_key: "creator_id"
  has_many :balance_changes

  validates :balance, presence: true

  # dodalam validacje dzieki temu latwiej bedzie pokazac im pozytywny i negatywny scenariusz dla create i update
  validates :first_name, presence: true

  def update_balance!
    update!(balance: balance_changes(true).sum(:change))
  end
end
