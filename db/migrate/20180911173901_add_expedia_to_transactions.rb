class AddExpediaToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :expedia, :boolean
  end
end
