class AddAircraftToFlights < ActiveRecord::Migration[6.0]
  def change
    add_column :flights, :aircraft, :string
  end
end
