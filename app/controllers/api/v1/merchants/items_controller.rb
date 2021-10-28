class Api::V1::Merchants::ItemsController < ApplicationController

  def index
    merchant = Merchant.find(params[:merchant_id])
    goods = merchant.items
    render json: ItemSerializer.new(goods)
  end

end
