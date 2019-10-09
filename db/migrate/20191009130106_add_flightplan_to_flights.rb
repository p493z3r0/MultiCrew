class AddFlightplanToFlights < ActiveRecord::Migration[6.0]
  def change
    add_column :flights, :flightplan, :text
  end
end
