require 'rails_helper'

describe "Items API Update" do
  context "Happy path, it can update" do
    it "can update an existing item" do
      vendor = create(:merchant)
      item = create(:item, merchant: vendor)
      item_params = { name: "Thingy"}

      put "/api/v1/items/#{item.id}", params: { item: item_params}

      expect(response).to be_successful
    end
  end

  context "Sad path, it fails to update" do
    it "shows error if given bad merchant id" do
      vendor = create(:merchant)
      item = create(:item, merchant: vendor)
      item_params = { name: "Thingy", merchant_id: 123748}

      put "/api/v1/items/#{item.id}", params: { item: item_params}
      expect(response).to have_http_status(:bad_request)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message).to have_key(:error)
      expect(message[:error]).to eq("Invalid Inputs")
    end

    it "shows an error if given bad item id" do
      vendor = create(:merchant)
      item = create(:item, merchant: vendor)
      item_params = { name: "Thingy"}

      put "/api/v1/items/1234566", params: { item: item_params}

      expect(response).to have_http_status(:not_found)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message).to have_key(:error)
      expect(message[:error]).to eq("Item does not exist")
    end
  end
end
