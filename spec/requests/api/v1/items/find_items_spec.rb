require 'rails_helper'

describe "Items API Search" do
  before :each do
    @item1 = create(:item, name: "Dog Book", unit_price: 2)
    @item2 = create(:item, name: "Cat Book", unit_price: 3)
    @item3 = create(:item, name: "Horse Book", unit_price: 4)
    @item4 = create(:item, name: "Dictionary", unit_price: 5)
  end

  it "finds all Items based on name search" do
    get "/api/v1/items/find_all", params: {name: "Book"}

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].count).to eq(3)
    expect(items[:data].first[:attributes][:name]).to eq("Cat Book")
  end

end
