class RemoveTimestampsFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :created_at
  end
end
