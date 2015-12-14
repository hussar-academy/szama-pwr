require "rails_helper"

RSpec.describe Api::V1::PaymentsController, type: :request do
  let!(:user) { User.create(first_name: "User") }
  let!(:other_user) { User.create(first_name: "Other") }
  let!(:api_endpoint) { "/api/v1/payments" }

  describe "GET /api/v1/payments" do
    before { get(api_endpoint) }

    it "works" do
      expect(response.status).to eq(200)
    end
  end

  describe "POST /api/v1/payments" do
    before { post(api_endpoint, payment_params) }

    let(:payment_params) do
      {
        creator_id: user.id,
        title: "Szamka",
        balance_changes: [
          { user_id: user.id, change: -10 },
          { user_id: other_user.id, change: -10 },
        ]
      }
    end

    it "works" do
      expect(response.status).to eq(201)
    end

    it "properly creates payment" do
      payment = Payment.last
      expect(payment.creator_id).to eq(user.id)
      expect(payment.title).to eq("Szamka")
      expect(payment.balance_changes.size).to eq(3)
      expect(user.reload.balance.to_i).to eq(10)
      expect(other_user.reload.balance.to_i).to eq(-10)
    end
  end
end
