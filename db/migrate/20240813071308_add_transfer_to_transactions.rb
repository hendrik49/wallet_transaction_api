class AddTransferToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :recipient_wallet_id, :integer
  end
end
