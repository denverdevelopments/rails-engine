require 'rails_helper'

describe "Items API Update" do
  xit "can create a new item" do
    vendor = create(:merchant)
    item_params = ({
                    name: 'Thing 1',
                    description: 'Is not Thing 2',
                    unit_price: 4.32,
                    merchant_id: vendor.id
                  })

    post "/api/v1/items", params: { item: item_params }
    created_item = Item.last

    expect(response).to be_successful
    expect(created_item.name).to eq(item_params[:name])
    expect(created_item.description).to eq(item_params[:description])
    expect(created_item.unit_price).to eq(item_params[:unit_price])

    created_item.destroy
  end
end
