require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    books = JSON.parse(response.body)

    expect(items.count).to eq(3)

    items.each do |item|
      expect(item).to have_key(:id)
      expect(item[:id]).to be_an(Integer)

      expect(item).to have_key(:title)
      expect(item[:title]).to be_a(String)

      expect(item).to have_key(:author)
      expect(item[:author]).to be_a(String)

      expect(item).to have_key(:genre)
      expect(item[:genre]).to be_a(String)

      expect(item).to have_key(:summary)
      expect(item[:summary]).to be_a(String)

      expect(item).to have_key(:number_sold)
      expect(item[:number_sold]).to be_an(Integer)
    end
  end

  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(merchant).to have_key(:id)
    expect(merchant[:id]).to eq(id)

    expect(merchant).to have_key(:title)
    expect(merchant[:title]).to be_a(String)

    expect(merchant).to have_key(:author)
    expect(merchant[:author]).to be_a(String)

    expect(merchant).to have_key(:genre)
    expect(merchant[:genre]).to be_a(String)

    expect(merchant).to have_key(:summary)
    expect(merchant[:summary]).to be_a(String)

    expect(merchant).to have_key(:number_sold)
    expect(merchant[:number_sold]).to be_an(Integer)
  end

  it "can create a new item" do
    item_params = ({
                    title: 'Murder on the Orient Express',
                    author: 'Agatha Christie',
                    genre: 'mystery',
                    summary: 'Filled with suspense.',
                    number_sold: 432
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    # We include this header to make sure that these params are passed as JSON rather than as plain text
    post "/api/v1/items", headers: headers, params: JSON.generate(item: book_params)
    created_item = Item.last

    expect(response).to be_successful
    expect(created_item.title).to eq(item_params[:title])
    expect(created_item.author).to eq(item_params[:author])
    expect(created_item.summary).to eq(item_params[:summary])
    expect(created_item.genre).to eq(item_params[:genre])
    expect(created_item.number_sold).to eq(item_params[:number_sold])
  end

  it "can update an existing item" do
    id = create(:item).id
    previous_name = Book.last.title
    item_params = { title: "Charlotte's Web" }
    headers = {"CONTENT_TYPE" => "application/json"}

    # We include this header to make sure that these params are passed as JSON rather than as plain text
    patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate({item: item_params})
    item = Item.find_by(id: id)

    expect(response).to be_successful
    expect(item.title).to_not eq(previous_name)
    expect(item.title).to eq("Charlotte's Web")
  end
end
