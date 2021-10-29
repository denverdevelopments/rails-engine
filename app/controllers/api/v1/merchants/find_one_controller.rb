class Api::V1::Merchants::FindOneController < ApplicationController

  def index
    if params[:name].nil? || params[:name] == ""
      return render json: { error: "Invalid search" }, status: 400
    end

    merchant = Merchant.search(params[:name]).first
    if merchant.nil?
      render json: {data: { error: 'no match' }}
    else
      render json: MerchantSerializer.new(merchant)
    end
end
