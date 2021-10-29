class Api::V1::Items::FindAllController < ApplicationController
  def index
    items = Item.search(params[:name])
    if items.first.nil?
      render json: {data: []}
    else
      render json: ItemSerializer.new(items)
    end
  end
end
