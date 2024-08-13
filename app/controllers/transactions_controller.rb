class TransactionsController < ApplicationController
  def create
    @wallet = Wallet.find_by(user_id: params[:user_id])
    @recipient_wallet = Wallet.find_by(id: transaction_params[:recipient_wallet_id])
    @transaction = @wallet.transactions.build(transaction_params)

    if params[:transaction_type] == "transfer"
      transaction = Transaction.new(
        wallet: wallet,
        recipient_wallet: recipient_wallet,
        amount: transaction_params[:amount],
        transaction_type: 'transfer'
      )
    end

    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:stock_id, :recipient_wallet_id, :amount, :transaction_type)
  end
end
