class Api::V1::MerchantsController < ApplicationController

  def index
    # render json: Merchant.all
    merchants = Merchant.all
    render json: MerchantSerializer.new(merchants).serializable_hash.to_json
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(merchant).serializable_hash.to_json
  end

  # def goods
  #   render json: Item.where(merchant_id: params[:merchant_id])
  # end

  private

    def merchant_params
      params.require(:merchant).permit(:name)
    end
end
