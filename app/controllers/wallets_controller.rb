class WalletsController < ApplicationController
  def show
    @wallet = Wallet.find_by(user_id: params[:user_id])
    render json: @wallet
  end
end
