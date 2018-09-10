class AddSaveCardToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :save_card, :boolean
  end
end
