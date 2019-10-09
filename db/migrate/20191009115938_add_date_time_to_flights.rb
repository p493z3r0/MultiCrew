class AddDateTimeToFlights < ActiveRecord::Migration[6.0]
  def change
    add_column :flights, :date, :datetime
  end
end
