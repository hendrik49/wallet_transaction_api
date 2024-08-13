class StocksController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @stocks = @team.stocks
    render json: @stocks
  end
end
