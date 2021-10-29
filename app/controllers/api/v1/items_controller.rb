class Api::V1::ItemsController < ApplicationController

  def index
    per_page = params.fetch(:per_page, 20).to_i
    page = [params.fetch(:page, 1).to_i, 1].max
    items = Item.offset((page - 1) * per_page).limit(per_page)
    render json: ItemSerializer.new(items)
  end

  def show
    item = Item.find(params[:id])
    render json: ItemSerializer.new(item)
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: ItemSerializer.new(item), status: :created
    else
      render json: {errors: 'invalid item'}, status: 404
    end
  end

  def update
    render json: Item.update(params[:id], item_params)
  end

  def show
    item = Item.find(params[:id])
    render json: ItemSerializer.new(item)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :unit_price, :merchant_id )
    end
end
