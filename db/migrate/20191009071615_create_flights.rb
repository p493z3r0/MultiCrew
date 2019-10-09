class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.string :from_airport, null: false
      t.string :to_airport, null: false
      t.references :pic_pilot, null: false
      t.references :cop_pilot, null: true
      t.timestamps
    end
  end
end
