class Api::V1::Items::MerchantsController < ApplicationController


  def show
    item = Item.find(params[:item_id])
    merchant = item.merhant
      render json: MerchantSerializer.new(merchant)
    # else
    #   render json: {errors: 'invalid id'}, status: :not_found
    # end
  end

  private

    def merchant_params
      params.require(:merchant).permit(:name)
    end
end
