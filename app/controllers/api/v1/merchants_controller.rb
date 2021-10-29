class Api::V1::MerchantsController < ApplicationController

  def index
    per_page = params.fetch(:per_page, 20).to_i
    page = [params.fetch(:page, 1).to_i, 1].max
    merchants = Merchant.offset((page - 1) * per_page).limit(per_page)
    render json: MerchantSerializer.new(merchants)
  end

  def show
    merchant = Merchant.find(params[:id])
    if merchant
      render json: MerchantSerializer.new(merchant)
    else
      render json: {errors: 'invalid id'}, status: :not_found
    end
  end

  private

    def merchant_params
      params.require(:merchant).permit(:name)
    end
end
