class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.integer :price
      t.integer :tix_purchased

      t.timestamps
    end
  end
end
