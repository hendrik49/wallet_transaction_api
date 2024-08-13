class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      Wallet.create(user: @user, balance: 0)
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def index
    @users = User.all
    render json: @users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
