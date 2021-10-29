require 'rails_helper'

describe "Items API Show" do
  context "Happy path, can find item" do
    it "can get one item by its id" do
      vendor = create(:merchant)
      id = create(:item, merchant: vendor).id

      get "/api/v1/items/#{id}"

      item = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful

      expect(item).to have_key(:id)
      expect(item[:id].to_i).to eq(id)
      expect(item[:id].to_i).to be_an(Integer)

      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_a(String)

      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes][:description]).to be_a(String)

      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:unit_price]).to be_an(Float)
    end
  end

  context "Sad path, can not find item" do
    it "returns a 404 error given a bad id input" do
      vendor = create(:merchant)
      items = create_list(:item, 3, merchant: vendor)

      get "/api/v1/items/4875875476867678"
      expect(response).to have_http_status(:not_found)

      get "/api/v1/items/abcdefg"
      expect(response).to have_http_status(:not_found)
    end
  end 
end
