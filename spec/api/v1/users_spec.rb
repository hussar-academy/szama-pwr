require "rails_helper"

def json_body
  JSON.parse(response.body)
end

RSpec.describe Api::V1::UsersController, type: :request do
  let!(:user) { User.create(first_name: "John") }
  let!(:api_endpoint) { "/api/v1/users" }

  describe "GET /api/v1/users" do
    before { get(api_endpoint) }

    it "works" do
      expect(response.status).to eq(200)
    end

    it "returns array of existing users" do
      expect(json_body.size).to eq(1)
      expect(json_body.first["id"]).to be(user.id)
    end
  end
end
