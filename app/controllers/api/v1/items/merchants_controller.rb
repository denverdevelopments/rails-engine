class Api::V1::Items::MerchantsController < ApplicationController


  def show
    item = Item.find(params[:item_id])
    vendor = item.merchant
    render json: MerchantSerializer.new(vendor)
  end

  private

    def merchant_params
      params.require(:merchant).permit(:name)
    end
end
