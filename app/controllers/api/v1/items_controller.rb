class Api::V1::ItemsController < ApplicationController
  before_action :item_exists, :set_item, only: [:show, :update, :destroy]

  def index
    per_page = params.fetch(:per_page, 20).to_i
    page = [params.fetch(:page, 1).to_i, 1].max
    items = Item.offset((page - 1) * per_page).limit(per_page)
    render json: ItemSerializer.new(items)
  end

  def show
    render json: ItemSerializer.new(@item)
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: ItemSerializer.new(item), status: :created
    else
      render json: {error: "Invalid Item", code: 400 }, status: :bad_request
    end
  end

  def update
    render json: Item.update(params[:id], item_params)
  end

  def destroy
    @item.destroy
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_exists
      render json: { error: "Item does not exist", code: 404 }, status: :not_found if !Item.exists?(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :unit_price, :merchant_id )
    end
end
