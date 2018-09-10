class AddLastFourToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :saved_cards, :last_four, :string
  end
end
