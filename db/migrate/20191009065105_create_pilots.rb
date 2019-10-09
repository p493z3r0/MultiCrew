class CreatePilots < ActiveRecord::Migration[6.0]
  def change
    create_table :pilots do |t|
      t.string :name
      t.string :lastname
      t.numeric :hours
      t.text :about
      t.string :simulator

      t.timestamps
    end
  end
end
