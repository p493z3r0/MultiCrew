class CreateAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :airports do |t|
      t.string :IATA
      t.string :ICAO

      t.timestamps
    end
  end
end
