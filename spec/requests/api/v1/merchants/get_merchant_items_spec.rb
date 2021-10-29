require 'rails_helper'

describe "Merchants API Items Index" do
  it "can get all items of one merchant by id" do
    vendor = create(:merchant)
    id = vendor.id
    create_list(:item, 4, merchant: vendor)

    get "/api/v1/merchants/#{id}/items"

    items = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(items.count).to eq(4)

    items.each do |item|
      expect(item).to have_key(:id)
      expect(item[:id].to_i).to be_an(Integer)

      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_a(String)
    end
  end
end
