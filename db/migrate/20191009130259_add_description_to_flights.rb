class AddDescriptionToFlights < ActiveRecord::Migration[6.0]
  def change
    add_column :flights, :description, :text
  end
end
