require "rails_helper"

RSpec.describe BalanceChange, type: :model do
  let!(:user) { User.create(first_name: "John") }
  let!(:payment) { Payment.create(title: "test", creator: user) }

  it "is valid with user, payment, and change" do
    balance_change = BalanceChange.new(user: user, payment: payment, change: 10)
    expect(balance_change).to be_valid
  end

  it "is invalid without user" do
    balance_change = BalanceChange.new
    balance_change.valid?
    expect(balance_change.errors[:user]).to include("can't be blank")
  end

  it "is invalid without paymet" do
    balance_change = BalanceChange.new
    balance_change.valid?
    expect(balance_change.errors[:payment]).to include("can't be blank")
  end

  it "is invalid without change" do
    balance_change = BalanceChange.new
    balance_change.valid?
    expect(balance_change.errors[:change]).to include("can't be blank")
  end

  context "on create" do
    it "commands user to update balance" do
      expect(user).to receive(:update_balance!)
      BalanceChange.create(user: user, payment: payment, change: 10)
    end
  end
end
