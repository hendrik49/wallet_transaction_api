class ChangeStockToTransactions < ActiveRecord::Migration[6.0]
  def change
    change_column_null :transactions, :stock_id, true
  end
end
