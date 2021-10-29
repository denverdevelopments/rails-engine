class Api::V1::Merchants::FindOneController < ApplicationController

  def index
    if params[:name].nil? || params[:name] == "" || params[:name] == " "
      return render json: { error: "Invalid search" }, status: 400
    else
      merchant = Merchant.search(params[:name]).first
      if merchant.empty?
        render json: {data: { error: 'No Match' }}
      else
        render json: MerchantSerializer.new(merchant)
      end
    end
  end
end
