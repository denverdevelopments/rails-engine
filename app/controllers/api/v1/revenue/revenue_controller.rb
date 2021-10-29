class Api::V1::RevenueController < ApplicationController
  before_action :merchant_exists, :set_merchant, only: [:show]

  def show
    total = Merchant.total_revenue(params[:id])
    render json: MerchantRevenueSerializer.new(total)
  end

  private

    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    def merchant_exists
      render json: { error: "Merchant does not exist", code: 404 }, status: :not_found if !Merchant.exists?(params[:id])
    end
end
