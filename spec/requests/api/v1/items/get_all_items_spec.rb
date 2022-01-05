require 'rails_helper'

describe "Items API Index" do
  it "sends a list of items" do
    vendor = create(:merchant)
    create_list(:item, 3, merchant: vendor)
    # require "pry"; binding.pry
    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(items.count).to eq(3)
    # require "pry"; binding.pry

    items.each do |item|
      expect(item).to have_key(:id)
      expect(item[:id].to_i).to be_an(Integer)

      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_a(String)

      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes][:description]).to be_a(String)

      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:unit_price]).to be_an(Float)
    end
  end

  it "sends a list of 20 items per page" do
    vendor = create(:merchant)
    create_list(:item, 35, merchant: vendor)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(items.count).to eq(20)
  end
end
