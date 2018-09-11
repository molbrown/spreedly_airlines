class AddCategorySavedCardIdToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :saved_cards, foreign_key: true
  end
end
