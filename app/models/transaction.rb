class Transaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :stock, optional: true
  belongs_to :recipient_wallet, class_name: 'Wallet', optional: true

  validates :amount, numericality: { greater_than: 0 }
  validates :transaction_type, inclusion: { in: %w[credit debit transfer] }

  after_create :update_wallet_balance

  private

  def update_wallet_balance
    if transaction_type == "credit"
      wallet.update(balance: wallet.balance - amount)
    elsif transaction_type == "debit"
      wallet.update(balance: wallet.balance + amount)
    elsif transaction_type == "transfer"
      wallet.update!(balance: wallet.balance - amount)
      recipient_wallet.update!(balance: recipient_wallet.balance + amount)
    end
  end
end
