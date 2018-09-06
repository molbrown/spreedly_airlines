class CreateSavedCards < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_cards do |t|
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
