class StocksController < ApplicationController
  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      render json: @stock, status: :created
    else
      render json: @stock.errors, status: :unprocessable_entity
    end
  end

  def show
    @stock = Stock.find(params[:id])
    render json: @stock
  end

  def index
    @team = Team.find(params[:team_id])
    @stocks = @team.stocks
    render json: @stocks
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :price)
  end
end
