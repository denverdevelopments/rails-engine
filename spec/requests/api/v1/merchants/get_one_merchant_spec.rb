require 'rails_helper'

describe "Merchants API Show" do
  context "Happy path, can show the merchant" do
    it "can get one merchant by its id" do
      id = create(:merchant).id

      get "/api/v1/merchants/#{id}"

      merchant = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful

      expect(merchant).to have_key(:id)
      expect(merchant[:id].to_i).to eq(id)

      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
    end

  end

  context "Sad path, fails to show the merchant" do
    it "returns a 404 error given a bad id input" do
      vendor = create(:merchant)

      get "/api/v1/merchants/4875875476867678"
      expect(response).to have_http_status(:not_found)

      get "/api/v1/merchants/abcdefg"
      expect(response).to have_http_status(:not_found)
    end
  end
end
