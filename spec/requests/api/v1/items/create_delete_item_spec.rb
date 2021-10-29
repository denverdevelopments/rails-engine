require 'rails_helper'

describe "Items API Create & Delete" do
  context "Happy path, can create item" do
    it "can create a new item" do
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

      delete "/api/v1/items/#{created_item.id}"

      expect(response).to be_successful
      expect{Item.find(created_item.id)}.to raise_error(ActiveRecord::RecordNotFound)

      get "/api/v1/items/#{created_item.id}"

      expect(response).to have_http_status(:not_found)
    end
  end

  context "Sad path, fails to create item" do
    it "create item sad path" do
      vendor = create(:merchant)
      item_params = ({
                      name: 'Missing attributes'
                    })

      post '/api/v1/items', params: { item: item_params}

      expect(response).to have_http_status(:bad_request)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message).to have_key(:code)
      expect(message[:code]).to eq(400)

      expect(message).to have_key(:error)
      expect(message[:error]).to eq("Invalid Item")
    end
  end
end
