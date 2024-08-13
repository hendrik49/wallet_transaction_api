class TransactionsController < ApplicationController
  def create
    @wallet = Wallet.find_by(user_id: params[:user_id])
    @transaction = @wallet.transactions.build(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:stock_id, :amount, :transaction_type)
  end
end
