class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :email
      t.string :token
      t.integer :amount
      t.integer :quantity
      t.belongs_to :flight, index: true

      t.timestamps
    end
  end
end
