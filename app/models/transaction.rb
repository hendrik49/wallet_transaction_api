class Transaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :stock

  validates :amount, numericality: { greater_than: 0 }
  validates :transaction_type, inclusion: { in: %w[buy sell] }

  after_create :update_wallet_balance

  private

  def update_wallet_balance
    if transaction_type == "Credit"
      wallet.update(balance: wallet.balance - amount)
    elsif transaction_type == "Debits"
      wallet.update(balance: wallet.balance + amount)
    end
  end
end
