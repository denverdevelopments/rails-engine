require 'rails_helper'

describe "Merchants API Search" do
  context "Happy path, can find named merchant" do
    xit 'can find one merchant based on name search' do
      vendor1 = Merchant.create(name: "Shop")
      vendor2 = Merchant.create(name: "Market")
      vendor3 = Merchant.create(name: "Store")

      search = "Market"

      get "/api/v1/merchants/find_one?name=#{search}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)
      expect(merchant[:data][:attributes][:name]).to eq("Market")
    end

    it "returns a null object if search has no results" do
      # it 'can find no merchant based on name search' do
      #   vendor1 = Merchant.create(name: "Shop")
      #   vendor2 = Merchant.create(name: "Market")
      #   vendor3 = Merchant.create(name: "Store")
      #
      # get "/api/v1/merchants/find_one", params: {name: "Boutique"}
      # expect(response).to be_successful
      #
      # merchant = JSON.parse(response.body, symbolize_names: true)
      #
      # expect(merchant[:data].count).to eq(0)
    end
  end

  context "Sad path, empty or no merchant search name" do
    it "shows search error message" do
      # get "/api/v1/merchants/find_one", params: {name: nil}
      # message = JSON.parse(response.body, symbolize_names: true)
      #
      # expect(message).to have_key(:code)
      # expect(message[:code]).to eq(400)
      #
      # expect(message).to have_key(:error)
      # expect(message[:error]).to eq("Invalid Search")
    end
  end
end
