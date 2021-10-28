class Api::V1::Merchants::ItemsController < ApplicationController

  def index
    render json: Merchant.all
  end

end
